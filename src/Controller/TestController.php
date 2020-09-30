<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class TestController extends AbstractController
{
    /**
     * @Route("/test", name="test")
     */
    public function index()
    {
        return $this->json([
            'message' => 'Welcome to your new controller!',
            'path' => 'src/Controller/TestController.php',
        ]);
    }

    /**
     * @Route("/hello", name="hello")
     */
    public function hello()
    {
        return $this->json([
            'message' => 'Hello!',
            'path' => 'src/Controller/TestController.php',
        ]);
    }

    /**
     * @Route("/bonjour", name="bonjour")
     */
    public function bonjour()
    {
        return $this->json([
            'message' => 'Bonjour !',
            'path' => 'src/Controller/TestController.php',
        ]);
    }

    /**
     * @Route("/hola", name="hola")
     */
    public function hola()
    {
        return $this->json([
            'message' => 'Holà!',
            'path' => 'src/Controller/TestController.php',
        ]);
    }
}
