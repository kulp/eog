#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

use File::Slurp;

my $prev_file = "";

# find PDF/eogsized/ -name '*.meter' |
#   xargs sed 's/ with Refrain//; s/ Iambic/_Iambic/g; s/ //g; s/_/ /g; s/—/-/g' |
#   sort |
#   uniq -u |
#   grep -w -n -F -f - scripts/makepoem.pl |
#   grep TODO |
#   cut -d: -f1 |
#   sed 's/$/d/' |
#   sed -i '' -f - scripts/makepoem.pl
my %meter_map = (
    "10.10.10.10." => "",
    "10.9.10.9.D." => "2468",
    "11.10.11.10." => "24",
    "11.11.11.11." => "",
    "5-11s." => "",
    "6.4.6.4.6.6.6.4." => "248",
    "6.5.6.5.6.5.D." => "2468",
    "6.5.6.5.D." => "2468",
    "6.6.6.6.8.8." => "24",
    "6.6.6.6.8.8.8." => "24",
    "6.6.8.4.D." => "2468",
    "6.6.9.D." => "245",
    "6-7s." => "",
    "6-8s." => "24",
    "7.5.7.5.D." => "2468",
    "7.6.7.6.7.7.7.6." => "248",
    "7.6.7.6.D." => "2468",
    "7.7.7.7." => "",
    "8.5.8.3." => "24",
    "8.5.8.5.D." => "2468",
    "8.6.8.6.6.6." => "2456",
    "8.6.8.6.8.6." => "246",
    "8.6.8.6.8.8.8.6." => "248",
    "8.7.8.7." => "24",
    # "8.7.8.7.7." => "", # no instances are not overridden
    "8.7.8.7.8.4.7." => "2468",
    "8.7.8.7.8.7." => "24556",
    # "8.7.8.7.8.7.D." => "", # no instances are not overridden
    "8.7.8.7.D." => "2468",
    "8.7.8.7.D. Iambic" => "2468",
    "8.8.6.D." => "36",
    "8.8.8.6." => "4",
    "8.8.8.8." => "24",
    "8.8.8.8.D." => "2468",
    "8-7s." => "",
    "9.6.9.6." => "24",
    "C.M." => "24",
    "C.M.D." => "2468",
    "L.M." => "",
    "L.M.D." => "",
    # "P.M." => "", # each P.M. is different
    "S.M." => "24",
    "S.M.D." => "2468",

    "8s." => "248",
);

my %eog_meter_overrides = (
    EOG004 => "8s.",
    EOG070 => "8.7.8.7.",
    EOG073 => "P.M.",
    EOG075 => "6s.",
    EOG077 => "8.7.8.7.8.7.",
    EOG127 => "P.M.",
    EOG144 => "6-8s.",
    EOG152 => "8.7.8.7.",
    EOG154 => "6.6.6.6.8.8.",
    EOG164 => "6-8s.",
    EOG197 => "4-11s.", # TODO revisit this
    EOG223 => "C.M.D.",
    EOG277 => "8.8.8.8.",
    EOG305 => "11.11.11.11.",
);

my %eog_indent_overrides = (
    EOG004 => "",
    EOG006 => "",
    EOG025 => "24",
    EOG028 => "",
    EOG030 => "24556778",
    EOG032 => "",
    EOG038 => "2468",
    EOG041 => "3",
    EOG042 => "24",
    EOG043 => "224488",
    EOG044 => "4",
    EOG045 => "45",
    EOG048 => "",
    EOG049 => "444",
    EOG052 => "245",
    EOG053 => "5",
    EOG054 => "24568",
    EOG055 => "2468",
    EOG056 => "248",
    EOG057 => "346",
    EOG058 => "34566",
    EOG059 => "248",
    EOG060 => "",
    EOG065 => "",
    EOG068 => "24",
    EOG072 => "34",
    EOG073 => "246899",
    EOG074 => "246899",
    EOG075 => "24",
    EOG076 => "",
    EOG077 => "24556",
    EOG078 => "4",
    EOG080 => "2455",
    EOG084 => "",
    EOG090 => "24", # TODO refrain
    EOG094 => "24",
    EOG095 => "2468", # TODO revisit after reviewing meter
    EOG098 => "", # TODO refrain
    EOG102 => "4488",
    EOG103 => "24",
    EOG112 => "24",
    EOG113 => "24", # TODO refrain
    EOG118 => "24",
    EOG124 => "24",
    EOG125 => "124",
    EOG126 => "24",
    EOG127 => "24",
    # EOG132 => "2468", # blue book has 2468, but we use our meter default.
    EOG134 => "2468",
    EOG136 => "24",
    EOG137 => "24",
    EOG138 => "",
    EOG139 => "24",
    EOG140 => "",
    EOG159 => "",
    EOG142 => "4",
    EOG149 => "24",
    EOG157 => "2468", # TODO revisit meter
    EOG158 => "36",
    EOG166 => "",
    EOG168 => "24",
    EOG173 => "24",
    EOG174 => "37",
    EOG175 => "24",
    EOG177 => "24",
    EOG184 => "77",
    EOG186 => "24",
    EOG187 => "",
    EOG188 => "24688",
    EOG191 => "24556",
    EOG193 => "4",
    EOG197 => "2468",
    EOG200 => "2468",
    EOG203 => "24",
    EOG209 => "2468",
    EOG210 => "",
    EOG211 => "", # TODO refrain
    EOG212 => "24",
    EOG218 => \2,
    EOG221 => "24",
    EOG225 => "",
    EOG229 => "5",
    EOG235 => "24",
    EOG237 => "245566",
    EOG238 => "2468",
    # EOG241 => "24", # blue book has 24, but we use our meter default.
    EOG242 => "",
    EOG244 => "24",
    EOG245 => "2457",
    EOG247 => "24568",
    EOG248 => "24",
    EOG249 => "248",
    EOG260 => "24689",
    EOG262 => "222444556677888",
    EOG268 => "24568",
    EOG270 => "",
    EOG271 => "2468",
    EOG273 => "2468",
    EOG279 => "1245",
    EOG281 => "2467",
    EOG290 => "4",
    EOG298 => "24",
    EOG299 => "2468",
    EOG301 => "245",
    EOG302 => "245",
    EOG304 => "2468",
    EOG309 => "",
    EOG310 => "24",
    EOG315 => "2455",
    EOG316 => "",
    EOG320 => "2468",
    EOG324 => "",
    EOG325 => "24",
    EOG327 => "",
    EOG331 => "246",
    EOG332 => "24",
    EOG333 => "4",
    EOG335 => "",
    EOG336 => "",
    EOG338 => "24",
    EOG340 => "",
    EOG341 => "2468",
    EOG344 => "44556688",
    EOG345 => "",
    EOG347 => "4",
    EOG350 => "4568", # TODO harmonize with EOG344?
    EOG351 => "24",
    EOG352 => "34",
    EOG353 => "24",
    EOG355 => "24",
    EOG356 => "24",
    EOG358 => "2468",
    EOG360 => "24",
    EOG365 => "4",
    EOG366 => "",
    EOG367 => "",
    EOG368 => "24",
    EOG369 => "24",
    EOG371 => "444",
    EOG372 => "",
    EOG373 => "24689",
    EOG375 => "24",
    EOG376 => "2468",
    EOG378 => "367799",
);

my $staged;
my $fh;
while (<ARGV>) {
    if ($ARGV ne $prev_file) {
        $prev_file = $ARGV;

        print $fh $staged, "\n" if defined $staged && defined $fh;

        my ($eog) = $ARGV =~ /(EOG\d+)/;
        my $meter = $eog_meter_overrides{$eog} || read_file "PDF/eogsized/$eog.meter"
            or die "No meter found for $eog";

        open $fh, ">", "booklayout/lyricsonly/fragments/$eog.tex";

        $meter =~ s/\s*with\s*Refrain//gi;
        $meter =~ s/ Iambic/_Iambic/;
        $meter =~ s/ //g;
        $meter =~ s/_/ /g;
        # Normalize dashes to hyphens for lookup purposes:
        (my $lookup = $meter) =~ s/—/-/g;

        my $indents = $eog_indent_overrides{$eog} // $meter_map{$lookup}
            // die "Indents indeterminate for $eog";

        undef $staged;
        say q(\vfill);
        say q(\input{booklayout/lyricsonly/fragments/) . $eog . q(});
        say $fh q(\renewcommand\thepoemmeter{) . $meter . "}";
        say $fh q(\titlepoem{\poemblanktitle});
        if (ref $indents) {
            say $fh q(\def\poemvsindentlines{});
            say $fh q(\setcounter{poemindentevery}{) . $$indents . "}";
        } else {
            say $fh q(\def\poemvsindentlines{) . $indents . "}";
            say $fh q(\setcounter{poemindentevery}{0});
        }
        say $fh q(\poem);
    }

    my $prev;
    if (/^$/) {
        $staged = qq( \\\\!\n);
    } else {
        print $fh $staged, "\n" if defined $staged;
        chomp;
        print $fh $_;
        $staged = q( \\\\);
    }
    $staged = qq( \\\\-\n) if eof;
    $prev = $_;

}

print $fh $staged, "\n" if defined $staged;
