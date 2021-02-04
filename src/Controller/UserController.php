<?php

namespace App\Controller;

use App\Model\BookingManager;

class UserController extends AbstractController
{
    public function showBooking()
    {
        if ($_SESSION['is_admin'] == 0) {
            $bookingManager = new BookingManager();
            $bookingInfo = $bookingManager->selectByID($_SESSION['id']);
            return $this->twig->render('User/booking.html.twig', ['bookingInfo' => $bookingInfo]);
        }
    }
}
