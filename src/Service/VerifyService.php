<?php

namespace App\Service;

use DateTime;

class VerifyService
{
    public function messageCheck()
    {
        $errors = '';
        if (empty($_POST["lastname"])) {
             $errors = "Veuillez entrer votre nom";
        } elseif (!preg_match("/[a-zA-Z0-9]+/", $_POST['lastname'])) {
             $errors = "Format invalide, uniquement des lettres";
        } elseif (empty($_POST["firstname"])) {
             $errors = "Veuillez entrer votre prénom";
        } elseif (!preg_match("/[a-zA-Z0-9]+/", $_POST['firstname'])) {
             $errors = "Format invalide, uniquement des lettres";
        } elseif (empty($_POST["email"])) {
             $errors = "Veuillez entrer votre e-mail";
        } elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
             $errors = "Format invalide";
        } elseif (empty($_POST["message"])) {
             $errors = "Vous n'avez pas laissé de message";
        } elseif (!preg_match("/[a-zA-Z0-9]+/", $_POST['message'])) {
             $errors = "Format invalide, uniquement des lettres et des chiffres";
        }
        return $errors;
    }

    public function bookingCheck()
    {
        // Checking time difference between arrival and departure
        $arrival = new DateTime($_POST['arrival']);
        $departure = new DateTime($_POST['departure']);
        $nightsNumber = $arrival->diff($departure)->format('%a');
        // Variable to display error
        $error = "";
        if (empty($_POST['arrival'])) {
            $error = "Veuillez entrer une date d'arrivée !";
        } elseif (empty($_POST['departure'])) {
            $error = "Veuillez entrer une date de départ !";
        } elseif ($nightsNumber < 3) {
            $error = "Réservation minimum de 3 nuits !";
        } elseif ($arrival > $departure) {
            $error = "Attention ! Il doit y avoir une erreur dans les dates";
        } elseif (empty($_POST['roomSelect'])) {
            $error = "Veuillez choisir une chambre !";
        } elseif (empty($_POST['guestSelect'])) {
            $error = "Veuillez sélectionner le nombre d'adultes !";
        } elseif (empty($_POST['childGuestSelect'])) {
            $error = "Veuillez sélectionner le nombre d'enfants !";
        }
        return $error;
    }
}
