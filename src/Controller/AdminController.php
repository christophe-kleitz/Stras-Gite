<?php

namespace App\Controller;

use App\Model\BookingManager;
use App\Model\ContactManager;

class AdminController extends AbstractController
{
    public function showBooking()
    {
        if ($_SESSION['is_admin'] == 1) {
            $bookingManager = new BookingManager();
            $bookingInfo = $bookingManager->selectAll();
            return $this->twig->render('Admin/booking.html.twig', ['bookingInfo' => $bookingInfo]);
        }
    }

    public function messageShow()
    {
        if ($_SESSION['is_admin'] == 1) {
            $contactManager = new ContactManager();
            $messages = $contactManager->selectAll();
            return $this->twig->render('Admin/messageShow.html.twig', ['messages' => $messages]);
        }
    }
}
