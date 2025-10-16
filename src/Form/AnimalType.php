<?php

namespace App\Form;

use App\Entity\Adoptant;
use App\Entity\Animal;
use App\Entity\Cage;
use App\Entity\CarnetDeSante;
use App\Entity\Espece;
use App\Entity\Maladie;
use App\Entity\Menu;
use App\Entity\Origine;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AnimalType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('age')
            ->add('dateArrivee')
            ->add('sexe')
            ->add('adoptable')
            ->add('espece', EntityType::class, [
                'class' => Espece::class,
                'choice_label' => 'id',
            ])
            ->add('origine', EntityType::class, [
                'class' => Origine::class,
                'choice_label' => 'id',
            ])
            ->add('carnetDeSante', EntityType::class, [
                'class' => CarnetDeSante::class,
                'choice_label' => 'id',
            ])
            ->add('maladie', EntityType::class, [
                'class' => Maladie::class,
                'choice_label' => 'id',
                'multiple' => true,
            ])
            ->add('cage', EntityType::class, [
                'class' => Cage::class,
                'choice_label' => 'id',
            ])
            ->add('adoptant', EntityType::class, [
                'class' => Adoptant::class,
                'choice_label' => 'id',
            ])
            ->add('menu', EntityType::class, [
                'class' => Menu::class,
                'choice_label' => 'id',
                'multiple' => true,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Animal::class,
        ]);
    }
}
