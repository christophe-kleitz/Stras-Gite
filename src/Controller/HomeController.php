<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

class HomeController extends AbstractController
{

    /**
     * Display home page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function index()
    {
        $directory = dir("./assets/images/room/");
        $roomPictures = [];
        while ($entry = $directory->read()) {
            if (
                $entry <> '.' && $entry <> '..' && $entry <> 'index.php' && $entry <> 'fond.jpg'
                && $entry <> '.DS_Store'
            ) {
                $roomPictures[] = $entry;
            }
        }
        $directory->close();
        return $this->twig->render('Home/index.html.twig', ['roomPicture' => $roomPictures]);
    }
}
