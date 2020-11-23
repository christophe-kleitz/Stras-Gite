<?php

namespace App\Controller;

use App\Model\ContactManager;
use App\Service\VerifyService;

class ContactController extends AbstractController
{
    public function add()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $verifyService = new VerifyService();
            $input = $verifyService->check($_POST);
            return $this->twig->render('Page/contact.html.twig', ['post' => $_POST, 'error' => $input]);

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
            return $this->twig->render('Page/thanks.html.twig', ['post' => $_POST]);
        }
    }
}
