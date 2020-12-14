<?php

namespace App\Model;

class ContactManager extends AbstractManager
{
    public const TABLE = 'message';

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function insert(array $message)
    {
        // prepared request
            $query = "INSERT INTO " . self::TABLE . " VALUES (null, :lastname, :firstname, :email, :message)";
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(':lastname', $message['lastname'], \PDO::PARAM_STR);
            $statement->bindValue(':firstname', $message['firstname'], \PDO::PARAM_STR);
            $statement->bindValue(':email', $message['email'], \PDO::PARAM_STR);
            $statement->bindValue(':message', $message['message'], \PDO::PARAM_STR);
            $statement->execute();
    }

    public function delete(int $id): void
    {
        // prepared request
        $statement = $this->pdo->prepare("DELETE FROM " . self::TABLE . " WHERE id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }
}
