<?php

namespace App\Controller;

use App\Model\ContactManager;

class ContactController extends AbstractController
{
    public function add()
    {
        $errors = '';
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (empty($_POST["lastname"])) {
                $errors = "Lastname is required";
                return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $errors]);
            } elseif (!preg_match("/[a-zA-Z0-9]+/", $_POST['lastname'])) {
                $errors = "Only letters and white space allowed";
                return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $errors]);
            } elseif (empty($_POST["firstname"])) {
                $errors = "Firstname is required";
                return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $errors]);
            } elseif (!preg_match("/^[a-zA-Z-' ]*$/", $_POST['firstname'])) {
                $errors = "Only letters and white space allowed";
                return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $errors]);
            } elseif (empty($_POST["email"])) {
                $errors = "Your e-mail is required";
                return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $errors]);
            } elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                $errors = "Invalid email format";
                return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $errors]);
            } elseif (empty($_POST["message"])) {
                $errors = "You left an empty message... Try again";
                return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $errors]);
            } else {
                $contactManager = new ContactManager();
                $message =
                    [
                        'lastname' => $_POST['lastname'],
                        'firstname' => $_POST['firstname'],
                        'email' => $_POST['email'],
                        'message' => $_POST['message']
                    ];
                $contactManager->insert($message);
                return $this->twig->render('Page/thanks.html.twig', ['post' => $_POST, 'error' => $errors]);
            }
        }
    }
}
