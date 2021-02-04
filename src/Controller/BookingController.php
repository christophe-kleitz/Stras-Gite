<?php

namespace App\Controller;

use App\Model\UserManager;
use App\Model\BookingManager;
use App\Model\RoomManager;
use App\Service\VerifyService;
use DateTime;

class BookingController extends AbstractController
{

    public function booking()
    {
        // setting minDate and maxDate for input date
        $minDate = \App\Service\TimeSetter::setDate('+ 3 days');
        $maxDate = \App\Service\TimeSetter::setDate('+ 1 year');

        // Checking for, and displaying error after POST
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Checking time difference between arrival and departure
            $arrival = new DateTime($_POST['arrival']);
            $departure = new DateTime($_POST['departure']);
            $nightsNumber = $arrival->diff($departure)->format('%a');
            $verifyService = new VerifyService();
            $error = $verifyService->bookingCheck();
            if ($error == '') {
            //Reversing date format to please french people UX/UI
                $displayArrival = $arrival->format('d-m-Y');
                $displayDeparture = $departure->format('d-m-Y');
            //Retrieving price per night for the selected room
                $room = new BookingManager();
                $room = $room->selectPrice($_POST['roomSelect']);
            //Sending number of nights to insert later in DB
                return $this->twig->render('Booking/summary.html.twig', [
                    'post' => $_POST,
                    'error' => $error,
                    'nightsNumber' => $nightsNumber,
                    'displayArrival' => $displayArrival,
                    'displayDeparture' => $displayDeparture,
                    'room' => $room
                    ]);
            }
            return $this->twig->render(
                'Booking/booking.html.twig',
                ['post' => $_POST, 'minDate' => $minDate, 'maxDate' => $maxDate, 'error' => $error]
            );
        }

    // For first show of the booking Page
    // Sending name of pages
        $roomManager = new RoomManager();
        $rooms = $roomManager->selectAll();
        return $this->twig->render('Booking/booking.html.twig', ['minDate' => $minDate,
         'maxDate' => $maxDate, 'rooms' => $rooms]);
    }

    public function register()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Variable to display error
            $error = "";
            // If already logged in
            if ($_SESSION) {
                // Transforming room service choice into bool for inserting in DB
                if ($_POST['roomServiceChoice'] === 50) {
                    $_POST['roomServiceChoice'] === 1;
                } else {
                    $_POST['roomServiceChoice'] === 0;
                }

                // Transforming child select choice into 0 for inserting in DB
                if ($_POST['childGuestSelect'] == 'aucun') {
                    $_POST['childGuestSelect'] === 0;
                }

                $bookingManager = new BookingManager();
                $bookingInfo =
                [
                    'firstname' => $_SESSION['firstname'],
                    'lastname' => $_SESSION['lastname'],
                    'email' => $_SESSION['email'],
                    'arrival' => $_POST['arrival'],
                    'departure' => $_POST['departure'],
                    'roomSelect' => $_POST['roomSelect'],
                    'guestSelect' => $_POST['guestSelect'],
                    'childGuestSelect' => $_POST['childGuestSelect'],
                    'nightsNumber' => $_POST['nightsNumber'],
                    'paidPrice' => $_POST['paidPrice'],
                    'roomServiceChoice' => $_POST['roomServiceChoice']
                ];
                $booking = $bookingManager->book($bookingInfo);

                return $this->twig->render('Booking/checkout.html.twig', ['bookingInfo' => $bookingInfo]);

            // if not logged in
            } else {
                if (empty($_POST["lastname"])) {
                    $error = "Merci de donner votre nom";
                    return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);
                } elseif (empty($_POST["firstname"])) {
                    $error = "Merci de donner votre prénom";
                    return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);
                } elseif (!is_numeric($_POST['phoneNumber'])) {
                    $error = "Veuillez donner votre numéro de télèphone. Celui-ci doit être sans espaces";
                    return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);
                } elseif (empty($_POST["email"])) {
                    $error = "Veuillez donner votre email";
                    return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);
                } elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                    $error = "Format d'email invalide";
                    return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);
                } elseif (
                        empty($_POST['password']) || empty($_POST['passwordCheck']) ||
                        $_POST['password'] <> $_POST['passwordCheck']
                ) {
                    $error = "Veuillez donner un mot de passe et le répeter";
                    return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);
                } elseif (
                        !preg_match(
                            '/^(?=.*\d)(?=.*[@#\-_$%^&+=§!\?])(?=.*[a-z])(?=.*[A-Z])[0-9A-Za-z@#\-_$%^&+=§!\?]{8,20}$/',
                            $_POST['password']
                        )
                ) {
                    $error = "Le mot de passe doit posséder au moins 1 majuscule, 1 minuscule,
                        1 chiffre et 1 caractère spécial (@#-_$%^&+=§!?).
                        Sa longueur doit être comprise entre 8 et 20.";
                    return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);
                } else {
                    // First check for already existing user email
                    $userManager = new UserManager();
                    $userEmail = ['email' => trim($_POST['email'])];
                    if ($userEmail = $userManager->emailCheck($userEmail)) {
                        $error = "Cet email existe déjà dans la base de donnée. 
                        Veuillez vous connecter à votre compte pour réserver";
                        return $this->twig->render('Booking/summary.html.twig', ['post' => $_POST, 'error' => $error]);

                        // Insert info
                    } else {
                        // Triming name for a nice display
                        $_POST['firstname'] = trim(ucfirst($_POST['firstname']));
                        $_POST['lastname'] = trim(ucfirst($_POST['lastname']));

                        // Inserting clients Info in DB
                        // Hashing password
                        $userInfo =
                        [
                        'firstname' => $_POST['firstname'],
                        'lastname' => $_POST['lastname'],
                        'email' => trim($_POST['email']),
                        'phoneNumber' => $_POST['phoneNumber'],
                        'password' => password_hash($_POST['password'], PASSWORD_DEFAULT)
                        ];
                        $registration = $userManager->register($userInfo);

                        // Check if User info were inserted, then insert booking info in DB
                        if ($registration) {
                            // Transforming room service choice into bool for inserting in DB
                            if ($_POST['roomServiceChoice'] === 50) {
                                $_POST['roomServiceChoice'] === 1;
                            } else {
                                $_POST['roomServiceChoice'] === 0;
                            }

                            // Transforming child select choice into 0 for inserting in DB
                            if ($_POST['childGuestSelect'] == 'aucun') {
                                $_POST['childGuestSelect'] === 0;
                            }

                            $bookingManager = new BookingManager();
                            $bookingInfo =
                            [
                                'firstname' => $_POST['firstname'],
                                'lastname' => $_POST['lastname'],
                                'email' => $_POST['email'],
                                'arrival' => $_POST['arrival'],
                                'departure' => $_POST['departure'],
                                'roomSelect' => $_POST['roomSelect'],
                                'guestSelect' => $_POST['guestSelect'],
                                'childGuestSelect' => $_POST['childGuestSelect'],
                                'nightsNumber' => $_POST['nightsNumber'],
                                'paidPrice' => $_POST['paidPrice'],
                                'roomServiceChoice' => $_POST['roomServiceChoice']
                            ];
                            $booking = $bookingManager->book($bookingInfo);

                            return $this->twig->render('Booking/checkout.html.twig', ['bookingInfo' => $bookingInfo]);
                        }
                    }
                }
            }
        }
    }
}
