<?php

namespace App\Controller;

use App\Entity\Article;
use App\Repository\ArticleRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\component\Form\Extension\Core\Type\TextType;
use Symfony\component\Form\Extension\Core\Type\SubmitType;
use Doctrine\ORM\EntityManagerInterface;
use App\Form\ArticleType;



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
        // $repo = $this->getDoctrine()->getRepository(Article::class);

        $article = $repo->findBy(array(), array('id' => 'ASC'));
        $articles = $repo->findAll();


        return $this->render('blog/index.html.twig', [
            'controller_name' => 'BlogController',
            'articles' => $articles
        ]);
    }

    /**
     * @Route("/blog/new", name="blog_create")
     * @Route("/blog/{id}/edit", name="blog_edit")
     */
    public function form(Article $article = null, Request $request, EntityManagerInterface $manager)
    { // initialement function create()
        // Si il n' y a pas d'articles, ajouter un nouvel article
        if (!$article) {
            $article = new Article(); // nous déclarons un article qui est vide mais pretà être rempli 
        }
        // si l'article n'a pas d'identifiant, donc pour une insertion, on ajoute la date de création
        if (!$article->getId()) {
            $article->setCreatedAt(new \DateTime()); // on ajoute la date à l'insertion
        }
        // $form est un objet complexe, nous allons demander à symfony de nous stocker le formulaire dans une variable simple à utilier.
        // $form = $this->createFormBuilder($article) // cela va créer un objet qui est lié à notre article
        //     // add() fonction permettant de créer des champs dans un formulaire
        //     ->add('title')
        //     ->add('content')
        //     ->add('image')
        //     ->getForm(); // permet d'afficher le rendu final
        $form = $this->createForm(ArticleType::class, $article);

        $form->handleRequest($request);

        // si le formulaire est bien soumit et valide
        if ($form->isSubmitted() && $form->isValid()) {
            $article->setCreatedAt(new \DateTime()); // on ajoute la date à l'insertion
            $manager->persist($article); // on prépare l'insertion
            $manager->flush(); // on insère
            return $this->redirectToRoute('blog_show', ['id' => $article->getId()]); // on redirige vers la page 'show.html.twig' avec le bon ID une fois l'article crée
        }
        // $article = new Article(); // nous déclarons un article qui est vide mais pret à être rempli
        $article->setTitle('Titre à la con')->setContent('Contenu de l\'article');
        return $this->render('blog/create.html.twig', [
            // createView() va retourner un petit objet qui représente l'affichage du formulaire, on le récupère sur la page create.html.twig
            'formArticle' => $form->createView(),
            'editMode' => $article->getId() !== null
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
