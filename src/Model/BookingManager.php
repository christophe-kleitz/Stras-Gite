<?php

namespace App\Model;

class BookingManager extends AbstractManager
{
    public const TABLE = 'booking';

    // initializes this class
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function book(array $booking)
    {
        // Retrieving client ID
        $clientID = "SELECT id FROM clients WHERE firstname = (:firstname) AND lastname= (:lastname)";
        $statement = $this->pdo->prepare($clientID);
        $statement->bindValue(':firstname', $booking['firstname'], \PDO::PARAM_STR);
        $statement->bindValue(':lastname', $booking['lastname'], \PDO::PARAM_STR);
        $statement->execute();
        $clientID = $statement->fetch();

        // Retrieving room ID
        $roomID = "SELECT id FROM room WHERE room = (:roomSelect)";
        $statement = $this->pdo->prepare($roomID);
        $statement->bindValue(':roomSelect', $booking['roomSelect'], \PDO::PARAM_STR);
        $statement->execute();
        $roomID = $statement->fetch();


        $query = "INSERT INTO " . self::TABLE . " VALUES (null, :client_id, 
        :room_id, DATE '" . $booking['arrival'] . "', 
        DATE '" . $booking['departure'] . "', :nb_adult, :nb_child, :nb_nights, :paid_price, :room_service)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':client_id', $clientID['id'], \PDO::PARAM_INT);
        $statement->bindValue(':room_id', $roomID['id'], \PDO::PARAM_INT);
        $statement->bindValue(':nb_adult', $booking['guestSelect'], \PDO::PARAM_INT);
        $statement->bindValue(':nb_child', $booking['childGuestSelect'], \PDO::PARAM_INT);
        $statement->bindValue(':nb_nights', $booking['nightsNumber'], \PDO::PARAM_INT);
        $statement->bindValue(':paid_price', $booking['paidPrice'], \PDO::PARAM_INT);
        $statement->bindValue(':room_service', $booking['roomServiceChoice'], \PDO::PARAM_BOOL);
        $statement->execute();
    }

    public function selectPrice(string $room)
    {
        $query = "SELECT price_per_night FROM room WHERE room = (:room)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':room', $room, \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetch();
    }

    public function selectByID(string $id)
    {
        $query = "SELECT b.*, r.room, c.firstname, c.lastname, c.email, c.phone_number 
        FROM " . self::TABLE . " b JOIN room r ON r.id=b.room_id JOIN clients c ON 
        c.id=client_id WHERE client_id=" . $id . "";
        $statement = $this->pdo->prepare($query);
        $statement->execute();
        return $statement->fetchAll();
    }

    public function selectAll(): array
    {
        $query = "SELECT b.*, r.room, c.firstname, c.lastname, c.email, c.phone_number 
        FROM " . self::TABLE . " b JOIN room r ON r.id=b.room_id JOIN clients c ON c.id=client_id";
        $statement = $this->pdo->prepare($query);
        $statement->execute();
        return $statement->fetchAll();
    }
}
