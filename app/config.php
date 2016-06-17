<?php
	//Constantes
	$configs = new HXPHP\System\Configs\Config;

	$configs->env->add('development');

    $configs->env->development->baseURI = '/six_shop/';

        $configs->env->development->database->setConnectionData([
            'driver' => 'mysql',
            'host' => 'localhost',
            'user' => 'root',
            'password' => '',
            'dbname' => 'sistemasix',
            'charset' => 'utf8'
        ]);
	return $configs;
