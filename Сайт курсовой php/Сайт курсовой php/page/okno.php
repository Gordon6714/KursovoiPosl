<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jura:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Junge&display=swap" rel="stylesheet">
    <style>
        .okno{
            position: absolute;
            width: 2000px;
            height: 2000px;

            background: #6F337D;
        }
        .okno_name{
            position: absolute;
            width: 308px;
            height: 58px;
            left: 335px;
            top: 25px;

            font-family: 'Junge';
            font-style: normal;
            font-weight: 400;
            font-size: 48px;
            line-height: 58px;

            color: #FFFFFF;
        }
        .okno_anketa{
            position: absolute;
            width: 406px;
            height: 333px;
            left: 83px;
            top: 207px;

            border: 1px solid #000000;
        }
        .okno_name_film{
            position: absolute;
            left: 0.49%;
            right: 48.77%;
            top: 0.9%;
            bottom: 90.69%;

            font-family: 'Jura';
            font-style: normal;
            font-weight: 400;
            font-size: 24px;
            line-height: 28px;

            color: #FFFFFF;
        }

        .okno_name_film_vibor_kino{
            position: absolute;
            width: 404px;
            height: 39px;
            left: 0px;
            top: 46px;

            background: #FFFFFF;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 8px;
        }
        .okno_name_adress{
            position: absolute;
            left: 0.49%;
            right: 48.03%;
            top: 38.14%;
            bottom: 53.45%;

            font-family: 'Jura';
            font-style: normal;
            font-weight: 400;
            font-size: 24px;
            line-height: 28px;

            color: #FFFFFF;
        }
        .okno_name_film_vibor_adressa{
            position: absolute;
            width: 404px;
            height: 39px;
            left: 0px;
            top: 170px;

            background: #FFFFFF;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 8px;
        }
        .okno_name_mesto{
            position: absolute;
            left: 0.49%;
            right: 50.25%;
            top: 75.38%;
            bottom: 16.22%;

            font-family: 'Jura';
            font-style: normal;
            font-weight: 400;
            font-size: 24px;
            line-height: 28px;

            color: #FFFFFF;
        }

        .okno_name_film_vibor_mesto{
            position: absolute;
            width: 404px;
            height: 39px;
            left: 0px;
            top: 294px;

            background: #FFFFFF;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 8px;
        }

        .summa{
            position: absolute;
            width: 149px;
            height: 24px;
            left: 192px;
            top: 748px;

            font-family: 'Jura';
            font-style: normal;
            font-weight: 400;
            font-size: 20px;
            line-height: 24px;
            /* identical to box height */


            color: #FFFFFF;
        }

        .btn_otprav{
            position: absolute;
            width: 214px;
            height: 40.34px;
            left: 588px;
            top: 740px;

            background: #6B8BFE;
            border-radius: 24px;
        }

        .btn_otprav_name{
            position: absolute;
            width: 161.38px;
            height: 19.3px;
            left: 33.33px;
            top: 7.02px;

            font-family: 'Jura';
            font-style: normal;
            font-weight: 400;
            font-size: 20px;
            line-height: 24px;

            color: #FFFFFF;
        }

        .btn_zabron{
            position: absolute;
            width: 214px;
            height: 40.34px;
            left: 588px;
            top: 740px;

            background: #6B8BFE;
            border-radius: 24px;
        }
        
    </style>
</head>
<body>



    <?php
    
    $link = mysqli_connect('localhost', 'root', '', 'cursovoi');

    if($link == false){
        print("Ошибка подключения");
        mysqli_connect_error();
    } else{
        
       ?> <div class="okno">
        <div class="okno_name">Заказ билета</div>
        <div class="okno_anketa">
            <form method="post" action="../script/script.php">
                <div class="okno_name_film">Название фильма</div>
                <select name="name_film" class="okno_name_film_vibor_kino">
                    <?php

                        $query = "SELECT * FROM `film`";
                        $result_select = mysqli_query($link, $query);

                        while ($object = mysqli_fetch_object($result_select)){
                            echo "<option value='$object->nazvanie'>$object->nazvanie</option>";}
                    ?>
                </select>

                <div class="okno_name_adress">Адрес кинотеатра</div>
                <select name="adress_kino" class="okno_name_film_vibor_adressa">

                    <?php
                        $query = "SELECT * FROM `adress`";
                        $result_select = mysqli_query($link, $query);

                        while ($object = mysqli_fetch_object($result_select)){
                            echo "<option value='$object->adress'>$object->adress</option>";}
                    ?>
                </select>

                <div class="okno_name_mesto">Место просмотра</div>
                <select name="mesto" class="okno_name_film_vibor_mesto">
                    <?php
                        $query = "SELECT * FROM `mesto`";
                        $result_select = mysqli_query($link, $query);

                        while ($object = mysqli_fetch_object($result_select)){
                            echo "<option value='$object->mesto'>$object->mesto</option>";}
                    ?>
                </select>

            </div>

            <input class="btn_zabron" name="btn" type="submit" value="Забронировать">

            </form>
        </div>
        <div class="summa">Стоимость : 0 р.</div>
    </div> <?php
    
    } 
    
    ?>
    

    


</body>
</html>