<?php

namespace App\Entity;

use App\Repository\EmployeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EmployeRepository::class)]
class Employe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    #[ORM\Column(length: 255)]
    private ?string $prenom = null;

    #[ORM\Column(length: 255)]
    private ?string $poste = null;

    /**
     * @var Collection<int, Allee>
     */
    #[ORM\OneToMany(targetEntity: Allee::class, mappedBy: 'employe')]
    private Collection $allees;

    /**
     * @var Collection<int, Cage>
     */
    #[ORM\ManyToMany(targetEntity: Cage::class, mappedBy: 'employe')]
    private Collection $cages;

    public function __construct()
    {
        $this->allees = new ArrayCollection();
        $this->cages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): static
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getPoste(): ?string
    {
        return $this->poste;
    }

    public function setPoste(string $poste): static
    {
        $this->poste = $poste;

        return $this;
    }

    /**
     * @return Collection<int, Allee>
     */
    public function getAllees(): Collection
    {
        return $this->allees;
    }

    public function addAllee(Allee $allee): static
    {
        if (!$this->allees->contains($allee)) {
            $this->allees->add($allee);
            $allee->setEmploye($this);
        }

        return $this;
    }

    public function removeAllee(Allee $allee): static
    {
        if ($this->allees->removeElement($allee)) {
            // set the owning side to null (unless already changed)
            if ($allee->getEmploye() === $this) {
                $allee->setEmploye(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Cage>
     */
    public function getCages(): Collection
    {
        return $this->cages;
    }

    public function addCage(Cage $cage): static
    {
        if (!$this->cages->contains($cage)) {
            $this->cages->add($cage);
            $cage->addEmploye($this);
        }

        return $this;
    }

    public function removeCage(Cage $cage): static
    {
        if ($this->cages->removeElement($cage)) {
            $cage->removeEmploye($this);
        }

        return $this;
    }
}
