<?php

namespace App\Entity;

use App\Repository\CarnetDeSanteRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CarnetDeSanteRepository::class)]
class CarnetDeSante
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTime $dateVaccination = null;

    #[ORM\OneToOne(mappedBy: 'carnetDeSante', cascade: ['persist', 'remove'])]
    private ?Animal $animal = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateVaccination(): ?\DateTime
    {
        return $this->dateVaccination;
    }

    public function setDateVaccination(\DateTime $dateVaccination): static
    {
        $this->dateVaccination = $dateVaccination;

        return $this;
    }

    public function getAnimal(): ?Animal
    {
        return $this->animal;
    }

    public function setAnimal(Animal $animal): static
    {
        // set the owning side of the relation if necessary
        if ($animal->getCarnetDeSante() !== $this) {
            $animal->setCarnetDeSante($this);
        }

        $this->animal = $animal;

        return $this;
    }
}
