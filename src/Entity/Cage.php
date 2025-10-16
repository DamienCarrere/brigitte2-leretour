<?php

namespace App\Entity;

use App\Repository\CageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CageRepository::class)]
class Cage
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $numero = null;

    #[ORM\ManyToOne(inversedBy: 'cages')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Allee $allee = null;

    /**
     * @var Collection<int, Employe>
     */
    #[ORM\ManyToMany(targetEntity: Employe::class, inversedBy: 'cages')]
    private Collection $employe;

    /**
     * @var Collection<int, Animal>
     */
    #[ORM\OneToMany(targetEntity: Animal::class, mappedBy: 'cage')]
    private Collection $animals;

    public function __construct()
    {
        $this->employe = new ArrayCollection();
        $this->animals = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNumero(): ?int
    {
        return $this->numero;
    }

    public function setNumero(int $numero): static
    {
        $this->numero = $numero;

        return $this;
    }

    public function getAllee(): ?Allee
    {
        return $this->allee;
    }

    public function setAllee(?Allee $allee): static
    {
        $this->allee = $allee;

        return $this;
    }

    /**
     * @return Collection<int, Employe>
     */
    public function getEmploye(): Collection
    {
        return $this->employe;
    }

    public function addEmploye(Employe $employe): static
    {
        if (!$this->employe->contains($employe)) {
            $this->employe->add($employe);
        }

        return $this;
    }

    public function removeEmploye(Employe $employe): static
    {
        $this->employe->removeElement($employe);

        return $this;
    }

    /**
     * @return Collection<int, Animal>
     */
    public function getAnimals(): Collection
    {
        return $this->animals;
    }

    public function addAnimal(Animal $animal): static
    {
        if (!$this->animals->contains($animal)) {
            $this->animals->add($animal);
            $animal->setCage($this);
        }

        return $this;
    }

    public function removeAnimal(Animal $animal): static
    {
        if ($this->animals->removeElement($animal)) {
            // set the owning side to null (unless already changed)
            if ($animal->getCage() === $this) {
                $animal->setCage(null);
            }
        }

        return $this;
    }
}
