<?php

namespace App\Controller;

use App\Entity\Article;
use App\Repository\ArticleRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class BlogController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function home(): Response
    {
        return $this->render('blog/home.html.twig', [
            'title' => 'Bienvenue sur le blog Symfony',
            'age' => 25
        ]);
    }
     /**
     * @Route("/blog/index", name="blog_index")
     */
    public function index(ArticleRepository $repo): Response
    {

        $article = $repo->findBy(array(), array('id' => 'ASC'));

        $repo = $this->getDoctrine()->getRepository(Article::class);
        $articles = $repo->findAll();

        return $this->render('blog/index.html.twig', [
            'controller_name' => 'BlogController',
            'articles' => $articles
        ]);
    }
/**
* @Route("/blog/{id}", name="blog_show")
*/
public function show($id)
{
$repo = $this->getDoctrine()->getRepository(Article::class);
$article = $repo->find($id);
return $this->render('blog/show.html.twig', [
'article' => $article

]);
}
}