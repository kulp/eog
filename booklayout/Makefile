# abc.pdf PDF WxH XxY+L+T 16-bit sRGB 0.000u 0:00.010
%.triminfo: %.pdf
	convert $< -trim info:$@

# W H X Y L T
%.trimdims: %.triminfo
	perl -ne 'print join "\t", map /(\d+)/g, (split " ")[2,3]; print "\n"' > $@ $<
