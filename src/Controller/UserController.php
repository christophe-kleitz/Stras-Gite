<?php

namespace App\Controller;

class UserController extends AbstractController
{
    public function showBooking()
    {
        if ($_SESSION['is_admin'] == 0) {
            return $this->twig->render('User/booking.html.twig');
        }
    }

    public function writeReview()
    {
        if ($_SESSION['is_admin'] == 0) {
            return $this->twig->render('User/writeReview.html.twig');
        }
    }

    public function summary()
    {
        // Setting again minDate and maxDate for input date (in case of errors)
        $minDate = \App\Model\BookingManager::setDate('+ 1 day');
        $maxDate = \App\Model\BookingManager::setDate('+ 1 year');

        // Checking time difference between arrival and departure
        $arrival = new \DateTime($_POST['arrival']);
        $departure = new \DateTime($_POST['departure']);
        $nightsNumber = $arrival->diff($departure)->format('%d');

        // Variable to display errors
        $errors = "";

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Checking for, and displaying errors
            if (empty($_POST['arrival'])) {
                $errors = "Veuillez entrer une date d'arrivée !";
                return $this->twig->render('Page/booking.html.twig', ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'errors' => $errors]);
            } elseif (empty($_POST['departure'])) {
                $errors = "Veuillez entrer une date de départ !";
                return $this->twig->render('Page/booking.html.twig', ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'errors' => $errors]);
            } elseif ($nightsNumber < 3) {
                $errors = "Réservation minimum de 3 nuits !";
                return $this->twig->render('Page/booking.html.twig', ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'errors' => $errors]);
            } elseif ($arrival > $departure) {
                $errors = "Attention ! Il doit y avoir une erreur dans les dates";
                return $this->twig->render('Page/booking.html.twig', ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'errors' => $errors]);
            } elseif (empty($_POST['roomSelect'])) {
                $errors = "Veuillez choisir une chambre !";
                return $this->twig->render('Page/booking.html.twig', ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'errors' => $errors]);
            } elseif (empty($_POST['guestSelect'])) {
                $errors = "Veuillez sélectionner le nombre d'adultes !";
                return $this->twig->render('Page/booking.html.twig', ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'errors' => $errors]);
            } elseif (empty($_POST['childGuestSelect'])) {
                $errors = "Veuillez sélectionner le nombre d'enfants !";
                return $this->twig->render('Page/booking.html.twig', ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'errors' => $errors]);
            } else {
            //Reversing date format to please french people UX/UI
                $_POST['arrival'] = $arrival->format('d/m/Y');
                $_POST['departure'] = $departure->format('d/m/Y');
            //Sending number of nights to insert later in DB
                return $this->twig->render('User/summary.html.twig', ['post' => $_POST, 'errors' => $errors, 'nightsNumber' => $nightsNumber]);
            }
        }
    }

    public function checkout()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            return $this->twig->render('User/checkout.html.twig', ['post' => $_POST]);
        }
    }
}
