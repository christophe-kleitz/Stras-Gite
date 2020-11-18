<?php

namespace App\Controller;

use App\Model\UserManager;
use App\Controller\UserController;

class LoginController extends AbstractController
{

    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userManager = new UserManager();
            $user =
                [
                    'email' => $_POST['email'],
                    'password' => $_POST['password']
                ];
            $login = $userManager->login($user);

            if (is_array($login)) {
                $_SESSION['email'] = $login['email'];
                $_SESSION['password'] = $login['password'];
                $_SESSION['firstname'] = $login['firstname'];
                $_SESSION['is_admin'] = $login['is_admin'];
                header('Location:/');
            } else {
                header('Location:/Login/login');
            }
        }
        return $this->twig->render('Login/login.html.twig');
    }

    public function logout()
    {
        if ($_SESSION) {
            $_SESSION = array();
            session_destroy();
            unset($_SESSION);
        }
        header('Location:/');
    }
}
