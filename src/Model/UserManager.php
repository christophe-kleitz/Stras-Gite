<?php

namespace App\Model;

class UserManager extends AbstractManager
{
    public const TABLE = 'clients';

    // initializes this class
    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function login(array $login)
    {
        $query = "SELECT * FROM " . self::TABLE . " WHERE email = (:email)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':email', $login['email'], \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetch();
    }

    public function emailCheck(array $email)
    {
        $query = "SELECT email FROM " . self::TABLE . " WHERE email = (:email)";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':email', $email['email'], \PDO::PARAM_STR);
        $statement->execute();
        return $statement->fetchColumn();
    }

    public function register(array $registration)
    {
        $query = "INSERT INTO " . self::TABLE . " VALUES (null, :firstname, :lastname, 
        :email, :phoneNumber, :password, '0')";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':firstname', $registration['firstname'], \PDO::PARAM_STR);
        $statement->bindValue(':lastname', $registration['lastname'], \PDO::PARAM_STR);
        $statement->bindValue(':email', $registration['email'], \PDO::PARAM_STR);
        $statement->bindValue(':phoneNumber', $registration['phoneNumber'], \PDO::PARAM_STR);
        $statement->bindValue(':password', $registration['password'], \PDO::PARAM_STR);
        $statement->execute();
        return true;
    }
}
