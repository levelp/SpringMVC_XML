<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <!-- Подключаем Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
</head>
<body>
<!-- Split button -->
<div class="btn-group">
    <button type="button" class="btn btn-danger">Action</button>
    <button type="button" class="btn btn-danger dropdown-toggle"
            data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false">
        <span class="caret"></span>
        <span class="sr-only">Toggle Dropdown</span>
    </button>
    <ul class="dropdown-menu">
        <li><a href="#">Action</a></li>
        <li><a href="#">Another action</a></li>
        <li><a href="#">Something else here</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="#">Separated link</a></li>
    </ul>
</div>

<div class="progress">
    <div class="progress-bar" id="my1"
         role="progressbar" aria-valuenow="0"
         aria-valuemin="0" aria-valuemax="100">
        0%
    </div>
</div>

<div class="progress">
    <div class="progress-bar" id="my2"
         role="progressbar" aria-valuenow="100"
         aria-valuemin="0" aria-valuemax="100">
        0%
    </div>
</div>

<form>
    <label>
        From:
        <input id="from"/>
    </label>
    <label>
        To:
        <input id="to"/>
    </label>
</form>

<input type="button" onclick="primes()" onsubmit="return false"/>

Результаты:
<div id="primes">
</div>

<script language="JavaScript">
    function primes() {
        console.log("вызов primes()");
        $.ajax({
            'url': '/ajax/primes/' + $("#from").val() + "/" + $("#to").val(),
            'success': function (data) {
                console.log(data);
                for (var i = 0, len = data.length; i < len; i++) {
                    $("#primes").append(data[i]).append(", ");
                }
            }
        });
        return false;
    }
</script>

</body>
<!-- Подключаем JavaScript в конце -->
<!-- Подключаем jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>
<script language="JavaScript">
    // TODO: добавить plugin для progressbar
    //$("#my-progress-bar").progressbar({
    //    maximum: 100,
    //    step: 1
    //});

    function progressValue(selector, p) {
        $(selector).css('width', p + '%').
                attr('aria-valuenow', p).html(p + '%');
    }

    function pg(selector, operation) {
        var p = (operation == 'inc') ? 0 : 100; // Проценты
        progressValue(selector, p);

        function timerTick() {
            $.ajax({
                'url': '/ajax/' + operation + '/' + p,
                'success': function (data) {
                    p = data;
                    progressValue(selector, p);
                    setTimeout(timerTick, 100);
                }
            });
        }

        setTimeout(timerTick, 100);
    }

    pg("#my1", "inc");
    pg("#my2", "dec");


</script>
</html>
