<?php

namespace App\Model;

class RoomManager extends AbstractManager
{
    const TABLE = 'room';

    public function __construct()
    {
        parent::__construct(self::TABLE);
    }

    public function selectOneById(int $id)
    {
        $statement = $this->pdo->prepare("SELECT * FROM self::table WHERE id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
    }

    public function insert(array $room): int
    {

        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " VALUES (null, :room, :description)");
        $statement->bindValue(':room', $room['room'], \PDO::PARAM_INT);
        $statement->bindValue(':description', $room['description'], \PDO::PARAM_STR);

        if ($statement->execute()) {
            return (int)$this->pdo->lastInsertId();
        }
    }

    public function delete(int $id): void
    {
        $statement = $this->pdo->prepare("DELETE FROM " . self::TABLE . " WHERE id=:id");
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }

    public function update(array $room)
    {

        $statement = $this->pdo->prepare("UPDATE " . self::TABLE . " SET `room`= :room , `description`= :description WHERE id=:id");
        $statement->bindValue('id', $room['id'], \PDO::PARAM_INT);
        $statement->bindValue('room', $room['room'], \PDO::PARAM_INT);
        $statement->bindValue('description', $room['description'], \PDO::PARAM_STR);

        return $statement->execute();
    }
}
