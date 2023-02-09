<?

$name_film = $_POST['name_film'];
$adress_kino = $_POST['adress_kino'];
$mesto = $_POST['mesto'];

$link = mysqli_connect('localhost', 'root', '', 'cursovoi');

if($link == false){
    print("Ошибка подключения");
    mysqli_connect_error();
} else{
    print("Успешно </br>");

    $query = "SELECT id_filma FROM `film` WHERE nazvanie = '$name_film'";
    $result_select = mysqli_query($link, $query);

    while ($object = mysqli_fetch_array($result_select)){
        $key_film = $object['id_filma'];
    }

    $query = "SELECT id_adressa FROM `adress` WHERE adress = '$adress_kino'";
    $result_select = mysqli_query($link, $query);

    while ($object = mysqli_fetch_array($result_select)){
        $key_adressa = $object['id_adressa'];
    }

    $query = "SELECT id_mesta FROM `mesto` WHERE mesto = '$mesto'";
    $result_select = mysqli_query($link, $query);

    while ($object = mysqli_fetch_array($result_select)){
        $key_mesta = $object['id_mesta'];
    }

    $sql = "INSERT INTO bilet (id_filma , id_adress , id_mesto) VALUE ( '$key_film' , '$key_adressa' , '$key_mesta' )";
    $result = mysqli_query($link,$sql);
    if ($result == false){
        print("Ошибка при выполнении запроса фильма");
    }



}
    




?>