// Adapted from http://www.vonloesch.de/node/23
// I use table.tBodies[0].rows instead of table.rows
function filter2(phrase, _id)
{
    var words = phrase.value.toLowerCase().split(" ");
    var table = document.getElementById(_id);
    var tbody = table.tBodies[0];
    var ele;
    for (var r = 0; r < tbody.rows.length; r++){
        ele = tbody.rows[r].innerHTML.replace(/<[^>]+>/g,"");
        var displayStyle = 'none';
        for (var i = 0; i < words.length; i++) {
            if (ele.toLowerCase().indexOf(words[i])>=0)
                displayStyle = '';
            else {
                displayStyle = 'none';
                break;
            }
        }
        tbody.rows[r].style.display = displayStyle;
    }
}

function do_reset()
{
    var box = document.getElementById('searchbox');
    box.value = "";
    filter2(box, 'main');
    box.focus();
    return false;
}

