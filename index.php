<?php
include('conexion.php');
extract($_REQUEST);
 
$alert = '';
session_start();
if(!empty($_SESSION['active']))
{
	header('location: sistema/');
}else{

if(!empty($_POST)){

	if (empty($_POST['usuario']) || empty($_POST['clave'])) {
		$alert= 'Ingrese se Usuario y Contraseña';
	}else{

		$db=new clasedb();
		$conex=$db->conectar();

		$user=$_POST['usuario']; 
		$pass=$_POST['clave'];

		$res=mysqli_query($conex,"SELECT * FROM usuario WHERE usuario='$user' AND clave='$pass'");
		mysqli_close($conex);
		$result=mysqli_num_rows($res);

		if($result > 0)
		{
			$data=mysqli_fetch_array($res);
			$_SESSION['active']=true;
			$_SESSION['idUser']=$data['id_usuario'];
			$_SESSION['nombre']=$data['nombre'];
			$_SESSION['email']=$data['correo'];
			$_SESSION['user']=$data['usuario'];
			$_SESSION['rol']=$data['rol'];

			header('location: sistema/');
		}else{
			$alert="Los datos ingresados son incorrectos";
			session_destroy();
		}
	}
}
}


?>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/fontawesome-free-5.13.1-web/css/all.css">
	<title>Login | Rego. Lab. System</title>
</head>
<body>
	<div id="main-container">

		<div id="left-container">

		<form action="" method="post">

			<div class="logo-container">
				<img src="img/emblema.jpg" width="150px">
			</div>

			<div class="title-container">
			<h1>Bienvenido</h1>

			<h3>Rego. Lab. System, C.A</h3>
			</div>

			<div class="inputs-container">
			<i class="fas fa-user"></i><input type="text" name="usuario" placeholder='Usuario'>
			<input type="password" name="clave" placeholder="Contraseña">

		
			<div class="alert"><?php echo isset($alert) ? $alert : ''; ?></div>
			<a href="">¿Has olvidado tu contraseña?</a>
			</div>
				<input type="submit" value="Iniciar Sección" class="btn_login">
				<a href="recuperar_password.php"><button type="submit">¿Has olvidado tu contraseña?</button></a>
		</form>

		</div>

		<div id="right-container">
			<img src="img/muestras.jpg" class="img-right-container">
		</div>

	</div>
</body>
</html>