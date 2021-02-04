<?php

namespace App\Controller;

use App\Model\RoomManager;

class RoomController extends AbstractController
{
    public function index()
    {
              $roomManager = new RoomManager();
              $rooms = $roomManager->selectAll();

              return $this->twig->render('Room/index.html.twig', ['rooms' => $rooms]);
    }


    public function show(int $id)
    {
              $roomManager = new RoomManager();
              $room = $roomManager->selectOneById($id);

              return $this->twig->render('Room/show.html.twig', ['room' => $room]);
    }


    public function edit(int $id)
    {
              $roomManager = new RoomManager();
              $room = $roomManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $room['id'] = $_POST['id'];
            $room['room'] = $_POST['room'];
            $room['description'] = $_POST['description'];
            $roomManager->update($room);
        }

              return $this->twig->render('Room/edit.html.twig', ['room' => $room]);
    }

    public function add()
    {

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $roomManager = new RoomManager();
            $room = [
            'room' => $_POST['room'],
            'description' => $_POST['description'],
                  ];
                  $id = $roomManager->insert($room);
                  header('Location:/Room/show/' . $id);
        }

              return $this->twig->render('Room/add.html.twig');
    }


    public function delete(int $id)
    {
              $roomManager = new RoomManager();
              $roomManager->delete($id);
              header('Location:/Room/index');
    }
}
