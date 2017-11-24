var rl = require("readline");
var fs = require("fs");

var prefix = "SYDQSplus";
var insertStr = function(str, flg, sn) { // 参数说明：str表示原字符串变量，flg表示要插入的字符串，sn表示要插入的位置
    var newstr = "";
    for (var i = 0; i < str.length; i += sn) {
        var tmp = str.substring(i, i + sn);
        newstr += tmp + flg;
    }
    return newstr;
};
var writeJson = function(path) {
    fs.readdir(path, "utf8", function(err, files) {
        if (err) throw err;

        var i = j = 0,
            len = files.length,
            obj = {};
        if (len) {
            for (; i < len; i++) {
                if (files[i].indexOf(".exe") > 0) {
                    obj[files[i].split(".exe")[0]] = prefix + j;
                    j++
                }
            }
        };

        fs.readFile("../index.html", "utf8", function(err, data) {
            if (err) throw err;

            var index = data.indexOf("/// insert start") + 16;
            data = insertStr(data, "\nvar data = " + JSON.stringify(obj) + ";", index);

            fs.writeFile("../index.html", data, "utf8", function(err) {
                if (err) throw err;
                console.log("文件写入完毕");
            })
        });
    });
};

var rl0 = rl.createInterface({
    input: process.stdin,
    output: process.stdout
});
rl0.question("请输入一个搜索路径: ", function(answer) {
    // console.log(`${answer}`);
    writeJson(answer);
    rl0.close();
});