var detetive = {};
detetive.MAP = [
/*      0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23 */
/* 0*/[00, 00, 00, 00, 00, 00, 00, 01, 00, 00, 00, 00, 00, 00, 00, 00, 94, 00, 00, 00, 00, 00, 00, 00],
/* 1*/[00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00],
/* 2*/[00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00],
/* 3*/[00, 00, 00, 00, 00, 00, 81, 01, 01, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00],
/* 4*/[00, 01, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00],
/* 5*/[93, 01, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 01, 01, 83, 00, 00, 00, 00, 00, 00],
/* 6*/[00, 00, 00, 00, 00, 00, 01, 01, 01, 00, 00, 82, 82, 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 00],
/* 7*/[00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 95],
/* 8*/[00, 00, 00, 00, 00, 00, 89, 01, 01, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 00],
/* 9*/[00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 84, 00, 00, 00, 00, 00, 00],
/*10*/[00, 00, 00, 89, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00],
/*11*/[00, 01, 01, 10, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00],
/*12*/[00, 88, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 84, 00, 00, 00, 00, 00, 00, 00],
/*13*/[00, 00, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00],
/*14*/[00, 00, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00],
/*15*/[00, 00, 00, 00, 00, 88, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00],
/*16*/[00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 00],
/*17*/[00, 01, 01, 01, 01, 01, 01, 01, 00, 86, 00, 00, 00, 00, 86, 00, 01, 01, 01, 01, 01, 01, 01, 01],
/*18*/[92, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 85, 00, 00, 00, 00],
/*19*/[00, 00, 00, 00, 87, 01, 01, 01, 86, 00, 00, 00, 00, 00, 00, 86, 01, 01, 00, 00, 00, 00, 00, 00],
/*20*/[00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00],
/*21*/[00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00],
/*22*/[00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 00, 00, 00, 00, 00, 00],
/*23*/[00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00],
/*24*/[00, 00, 00, 00, 00, 00, 00, 00, 00, 91, 00, 00, 00, 00, 96, 00, 00, 00, 00, 00, 00, 00, 00, 00]
        ];
/*
function clicker(obj, evt) {
    var hid = document.getElementById('hdnStatus');
    var move = document.getElementById('txtMove');
    var id = obj.id;
    var pos = id.split('_');
    var row = pos[0];
    var col = pos[1];
    
    if (detetive.MAP[row][col] == 2) {
        var player = document.getElementById('hdnPlayer1');
        var pos = findPosition(player.value);
        //showAccuse();
        var changeClass = '';
        switch (player.value) {
            case "91":
                changeClass = 'yellowMove';
                break;
            case "92":
                changeClass = 'purpleMove';
                break;
            case "93":
                changeClass = 'blackMove';
                break;
            case "94":
                changeClass = 'blueMove';
                break;
            case "95":
                changeClass = 'redMove';
                break;
            case "96":
                changeClass = 'grayMove';
                break;
        }

        var row_col = pos.split('_');
        detetive.MAP[parseInt(row_col[0])][parseInt(row_col[1])] = 1;
        $("#" + pos).removeClass(changeClass);
        $("#" + obj.id).removeClass('enableArea');
        $("#" + obj.id).addClass(changeClass);
        detetive.MAP[row][col] = parseInt(player.value);
        clearMap();
    }
}*/

function clearMap() {
    for (var i = 0; i < 25; i++) {
        for (var j = 0; j < 24; j++) {
            if (detetive.MAP[i][j] == 2) {
                $("#" + i.toString() + "_" + j.toString()).removeClass('enableArea');
                $("#" + i.toString() + "_" + j.toString()).addClass('step');
                detetive.MAP[i][j] = 1;
            } else if (detetive.MAP[i][j] == 81 || detetive.MAP[i][j] == 82 || detetive.MAP[i][j] == 83 || detetive.MAP[i][j] == 84 || detetive.MAP[i][j] == 85 || detetive.MAP[i][j] == 86 || detetive.MAP[i][j] == 87 || detetive.MAP[i][j] == 88 || detetive.MAP[i][j] == 89)
                $("#" + i.toString() + "_" + j.toString()).removeClass('roomArea');
        }
    }
}

function enableMove(pos_x, pos_y, move) {
    var range = move;
    for (var i = 0; i <= move; i++) {
        for (var j = 0; j <= range; j++) {
            if (i != 0 || j != 0) {
                verifPos(pos_x, pos_y, i, j);
                verifPos(pos_x, pos_y, i, j);
            }
        }
        range--;
    }
}

function selectImage(obj) {
    $('img').removeClass('selectedImage');
    $("#" + obj.id).addClass('selectedImage');
}

function randomDice(val, pos_x, pos_y) {
    var divBackGround = "<div class=\"background\"></div>";
    $("body").append(divBackGround + "<div class=\"dicePanel\">" + "<img id=\"dice\" src=\"\" alt=\"\" />" + "</div>");
    $("#dice").attr('src', 'Images/dado_animado_menor.gif');
    $("div.background").css({ opacity: 0.3 });
    var width = $("div.dicePanel").width();
    var height = $("div.dicePanel").height();
    var windowHeight = $(window).height();
    var windowWidth = $(window).width();
    var top = windowHeight / 2 - height / 2;
    var left = windowWidth / 2 - width / 2;
    $("div.dicePanel").css({ opacity: 0, top: top - 50, left: left });
    $("div.dicePanel").animate({ opacity: 1, "top": top, "left": left }, 200);
    hide(val, pos_x, pos_y);
}

function hide(val, pos_x, pos_y) {
    var move = val;
    if (move < 0) move = move * (-1);
    if (move == 0) move++;
    setTimeout(function () {
        $("#dice").attr('src', '');
        $("div.dicePanel,div.background").remove();
        var player = document.getElementById('hdnPlayer1');
        enableMove(pos_x, pos_y, move);
    }, 2800);
    setTimeout(function () {
        var divBackGround = "<div class=\"background\"></div>";
        $("body").append(divBackGround + "<div class=\"dicePanel\">" + "<img id=\"dice\" src=\"\" alt=\"\" />" + "</div>");
        $("#dice").attr('src', 'Images/dado_' + move.toString() + '.gif');
        $("div.background").css({ opacity: 0.3 });
        var width = $("div.dicePanel").width();
        var height = $("div.dicePanel").height();
        var windowHeight = $(window).height();
        var windowWidth = $(window).width();
        var top = windowHeight / 2 - height / 2;
        var left = windowWidth / 2 - width / 2;
        $("div.dicePanel").css({ opacity: 0, top: top - 50, left: left });
        $("div.dicePanel").animate({ opacity: 1, "top": top, "left": left }, 200);
    }, 2800);
    setTimeout(function () {
        $("#dice").attr('src', '');
        $("div.dicePanel,div.background").remove();
    }, 4000);
}

function findPosition(value) {
    for (var i = 0; i < 25; i++) {
        for (var j = 0; j < 24; j++) {
            if (detetive.MAP[i][j] == value)
                return i.toString() + "_" + j.toString();
        }
    }
}

function showAccuse(room) {
    var imageRoom = "";
    switch (room) {
        case 81:
            imageRoom = "local_cozinha.jpg";
            break;
        case 82:
            imageRoom = "local_hall.jpg"; 
            break;
        case 83:
            imageRoom = "local_sala de jogos.jpg";
            break;
        case 84:
            imageRoom = "local_quarto.jpg";
            break;
        case 85:
            imageRoom = "local_sala de estar.jpg";
            break;
        case 86:
            imageRoom = "local_sala de estudo.jpg";
            break;
        case 87:
            imageRoom = "local_banheiro.jpg";
            break;
        case 88:
            imageRoom = "local_quarto hospede.jpg";
            break;
        case 89:
            imageRoom = "local_sala de jantar.jpg";
            break;
    }

    var divBackGround = "<div class=\"backAccuse\"></div>";
    $("body").append(divBackGround + "<div class=\"accusePanel\">" + "<div class=\"spaceHeader\">" +
                "&nbsp;" +
            "</div>" +
            "<div>" +
                "<div class=\"spaceLeft\">" +
                    "&nbsp;" +
                "</div>" +
                "<div class=\"imageLocal\">" +
                    "<img id=\"imgLocal\" src=\"Images/Cards/" + imageRoom  + "\" alt=\"\" width=\"100px\" />" +
                "</div>" +
            "</div>" +
            "<div class=\"headerSuspect\">&nbsp;</div>" +
            "<div>" +
                "<table class=\"suspects\" cellspacing=\"10\">" +
                    "<tr>" +
                        "<td><img id=\"suspect_1\" src=\"Images/Cards/person_becky.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"suspect_2\" src=\"Images/Cards/person_dwight.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"suspect_3\" src=\"Images/Cards/person_hartigan.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"suspect_4\" src=\"Images/Cards/person_marv.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"suspect_5\" src=\"Images/Cards/person_nancy.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"suspect_6\" src=\"Images/Cards/person_shellie.jpg\" alt=\"\" width=\"100px\" /></td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td><input type=\"radio\" id=\"rdoActor_1\" name=\"susp\" value=\"1\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoActor_2\" name=\"susp\" value=\"2\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoActor_3\" name=\"susp\" value=\"3\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoActor_4\" name=\"susp\" value=\"4\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoActor_5\" name=\"susp\" value=\"5\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoActor_6\" name=\"susp\" value=\"7\" /></td>" +
                    "</tr>" +
                "</table>" +
            "</div>" +
            "<div class=\"spaceWeapons\">&nbsp;</div>" +
            "<div>" +
                "<table class=\"suspects\" cellspacing=\"10\">" +
                    "<tr>" +
                        "<td><img id=\"weapon_1\" src=\"Images/Cards/arma_castical.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"weapon_2\" src=\"Images/Cards/arma_chave inglesa.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"weapon_3\" src=\"Images/Cards/arma_corda.jpg\"  alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"weapon_4\" src=\"Images/Cards/arma_faca.jpg\" alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"weapon_5\" src=\"Images/Cards/arma_martelo.jpg\"  alt=\"\" width=\"100px\" /></td>" +
                        "<td><img id=\"weapon_6\" src=\"Images/Cards/arma_revolver.jpg\"  alt=\"\" width=\"100px\" /></td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td><input type=\"radio\" id=\"rdoWeapon_1\" name=\"weap\" value=\"10\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoWeapon_2\" name=\"weap\" value=\"11\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoWeapon_3\" name=\"weap\" value=\"12\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoWeapon_4\" name=\"weap\" value=\"13\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoWeapon_5\" name=\"weap\" value=\"14\" /></td>" +
                        "<td><input type=\"radio\" id=\"rdoWeapon_6\" name=\"weap\" value=\"17\" /></td>" +
                    "</tr>" +
                "</table>" +
            "</div>" +
            "<div class=\"spaceButton\">&nbsp;</div>" +
            "<div align=\"center\">" +
                "<input type=\"button\" value=\"FAZER SUGESTÃO\" class=\"button\" onclick=\"makeSugestion();\" />" +
            "</div>" + "</div>");
    $("div.backAccuse").css({ opacity: 0.3 });
    var width = $("div.accusePanel").width();
    var height = $("div.accusePanel").height();
    var windowHeight = $(window).height();
    var windowWidth = $(window).width();
    var top = windowHeight / 2 - height / 2;
    var left = windowWidth / 2 - width / 2;
    $("div.accusePanel").css({ opacity: 0, top: top - 50, left: left });
    $("div.accusePanel").animate({ opacity: 1, "top": top, "left": left }, 200);
}

function hideAccuse() {
    $("div.accusePanel,div.backAccuse").remove();
}



function verifPos(x, y, i, j) {
    if ((x + i < 25) && (y + j < 24) && (detetive.MAP[x + i][y + j] == 1 || parseInt(detetive.MAP[x + i][y + j] / 10) == 8)) {
        if (test(x + i, y + j)) {
            if (detetive.MAP[x + i][y + j] == 1) {
                $("#" + (x + i).toString() + "_" + (y + j).toString()).addClass('enableArea');
                detetive.MAP[x + i][y + j] = 2;
            } else {
                $("#" + (x + i).toString() + "_" + (y + j).toString()).addClass('roomArea');
            }
        }
    }
    if ((x + i < 25) && (y - j > 0) && (detetive.MAP[x + i][y - j] == 1 || parseInt(detetive.MAP[x + i][y - j] / 10) == 8)) {
        if (test(x + i, y - j)) {
            if (detetive.MAP[x + i][y - j] == 1) {
                $("#" + (x + i).toString() + "_" + (y - j).toString()).addClass('enableArea');
                detetive.MAP[x + i][y - j] = 2;
            } else {
                $("#" + (x + i).toString() + "_" + (y - j).toString()).addClass('roomArea');
            }
        }
    }

    if ((x - i > 0) && (y + j < 24) && (detetive.MAP[x - i][y + j] == 1 || parseInt(detetive.MAP[x - i][y + j] / 10) == 8)) {
        if (test(x - i, y + j)) {
            if (detetive.MAP[x - i][y + j] == 1) {
                $("#" + (x - i).toString() + "_" + (y + j).toString()).addClass('enableArea');
                detetive.MAP[x - i][y + j] = 2;
            } else {
                $("#" + (x - i).toString() + "_" + (y + j).toString()).addClass('roomArea');
            }
        }
    }
    if ((x - i > 0) && (y - j > 0) && (detetive.MAP[x - i][y - j] == 1 || parseInt(detetive.MAP[x - i][y - j] / 10) == 8)) {
        if (test(x - i, y - j)) {
            if (detetive.MAP[x - i][y - j] == 1) {
                $("#" + (x - i).toString() + "_" + (y - j).toString()).addClass('enableArea');
                detetive.MAP[x - i][y - j] = 2;
            } else {
                $("#" + (x - i).toString() + "_" + (y - j).toString()).addClass('roomArea');
            }
        }
    }
}

function test(x, y) {
    var enable = false;
    var player = parseInt(document.getElementById('hdnPlayer1').value);
    if (x + 1 < 25) {
        if (detetive.MAP[x + 1][y] == 2 || detetive.MAP[x + 1][y] == player)
            enable = true;
    }
    if (x - 1 >= 0) {
        if (detetive.MAP[x - 1][y] == 2 || detetive.MAP[x - 1][y] == player)
            enable = true;
    }
    if (y + 1 < 24) {
        if ((y + 1 < 24) && detetive.MAP[x][y + 1] == 2 || detetive.MAP[x][y + 1] == player)
            enable = true;
    }
    if (y - 1 >= 0) {
        if (detetive.MAP[x][y - 1] == 2 || detetive.MAP[x][y - 1] == player)
            enable = true;
    }
    return enable;
}

function loadCards() {
    /*var hid = document.getElementById('hdnStartGame');
    if (hid.value == 0) {*/
    var divBackGround = "<div class=\"background\"></div>";
    $("body").append(divBackGround + "<div class=\"dicePanel\">" + "<img id=\"dice\" src=\"\" alt=\"\" />" + "</div>");
    $("#dice").attr('src', 'Images/top_secret_min.gif');
    $("div.background").css({ opacity: 0.3 });
    var width = $("div.dicePanel").width();
    var height = $("div.dicePanel").height();
    var windowHeight = $(window).height();
    var windowWidth = $(window).width();
    var top = windowHeight / 2 - height / 2;
    var left = windowWidth / 2 - 800 / 2;
    $("div.dicePanel").css({ opacity: 0, top: top - 50, left: left });
    $("div.dicePanel").animate({ opacity: 1, "top": top, "left": left }, 200);
    setTimeout(function () {
        $("#dice").attr('src', '');
        $("div.dicePanel,div.background").remove();
    }, 5500);
        /*hid.value = 1;
    }*/
}


function getMAP(array) {
    var lines = array.split('|');
    for (var i = 0; i < lines.length - 1; i++) {
        var cell = lines[i].split(',');
        for (var j = 0; j < cell.length; j++) {
            detetive.MAP[i][j] = parseInt(cell[j]);
        }
    }
}