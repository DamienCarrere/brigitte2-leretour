<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251016141331 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE adoptant (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, prenom VARCHAR(255) NOT NULL, adresse VARCHAR(255) NOT NULL, telephone VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE allee (id INT AUTO_INCREMENT NOT NULL, employe_id INT DEFAULT NULL, numero INT NOT NULL, INDEX IDX_771FD92A1B65292 (employe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE animal (id INT AUTO_INCREMENT NOT NULL, espece_id INT NOT NULL, origine_id INT NOT NULL, carnet_de_sante_id INT NOT NULL, cage_id INT NOT NULL, adoptant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, age INT NOT NULL, date_arrivee DATE NOT NULL, sexe VARCHAR(255) NOT NULL, adoptable TINYINT(1) NOT NULL, INDEX IDX_6AAB231F2D191E7A (espece_id), INDEX IDX_6AAB231F87998E (origine_id), UNIQUE INDEX UNIQ_6AAB231F8B20F9C8 (carnet_de_sante_id), INDEX IDX_6AAB231F5A70E5B7 (cage_id), INDEX IDX_6AAB231F8D8B49F9 (adoptant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE animal_maladie (animal_id INT NOT NULL, maladie_id INT NOT NULL, INDEX IDX_221B6D718E962C16 (animal_id), INDEX IDX_221B6D71B4B1C397 (maladie_id), PRIMARY KEY(animal_id, maladie_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE animal_menu (animal_id INT NOT NULL, menu_id INT NOT NULL, INDEX IDX_3A287BA78E962C16 (animal_id), INDEX IDX_3A287BA7CCD7E912 (menu_id), PRIMARY KEY(animal_id, menu_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE cage (id INT AUTO_INCREMENT NOT NULL, allee_id INT NOT NULL, numero INT NOT NULL, INDEX IDX_56A64E518E6975D2 (allee_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE cage_employe (cage_id INT NOT NULL, employe_id INT NOT NULL, INDEX IDX_79E207205A70E5B7 (cage_id), INDEX IDX_79E207201B65292 (employe_id), PRIMARY KEY(cage_id, employe_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE carnet_de_sante (id INT AUTO_INCREMENT NOT NULL, date_vaccination DATE NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE employe (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, prenom VARCHAR(255) NOT NULL, poste VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE espece (id INT AUTO_INCREMENT NOT NULL, famille_id INT NOT NULL, nom VARCHAR(255) NOT NULL, INDEX IDX_1A2A1B197A77B84 (famille_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE famille (id INT AUTO_INCREMENT NOT NULL, ordre_id INT NOT NULL, nom VARCHAR(255) NOT NULL, INDEX IDX_2473F2139291498C (ordre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE maladie (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, description VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE menu (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, type VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ordre (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE origine (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE allee ADD CONSTRAINT FK_771FD92A1B65292 FOREIGN KEY (employe_id) REFERENCES employe (id)');
        $this->addSql('ALTER TABLE animal ADD CONSTRAINT FK_6AAB231F2D191E7A FOREIGN KEY (espece_id) REFERENCES espece (id)');
        $this->addSql('ALTER TABLE animal ADD CONSTRAINT FK_6AAB231F87998E FOREIGN KEY (origine_id) REFERENCES origine (id)');
        $this->addSql('ALTER TABLE animal ADD CONSTRAINT FK_6AAB231F8B20F9C8 FOREIGN KEY (carnet_de_sante_id) REFERENCES carnet_de_sante (id)');
        $this->addSql('ALTER TABLE animal ADD CONSTRAINT FK_6AAB231F5A70E5B7 FOREIGN KEY (cage_id) REFERENCES cage (id)');
        $this->addSql('ALTER TABLE animal ADD CONSTRAINT FK_6AAB231F8D8B49F9 FOREIGN KEY (adoptant_id) REFERENCES adoptant (id)');
        $this->addSql('ALTER TABLE animal_maladie ADD CONSTRAINT FK_221B6D718E962C16 FOREIGN KEY (animal_id) REFERENCES animal (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE animal_maladie ADD CONSTRAINT FK_221B6D71B4B1C397 FOREIGN KEY (maladie_id) REFERENCES maladie (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE animal_menu ADD CONSTRAINT FK_3A287BA78E962C16 FOREIGN KEY (animal_id) REFERENCES animal (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE animal_menu ADD CONSTRAINT FK_3A287BA7CCD7E912 FOREIGN KEY (menu_id) REFERENCES menu (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE cage ADD CONSTRAINT FK_56A64E518E6975D2 FOREIGN KEY (allee_id) REFERENCES allee (id)');
        $this->addSql('ALTER TABLE cage_employe ADD CONSTRAINT FK_79E207205A70E5B7 FOREIGN KEY (cage_id) REFERENCES cage (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE cage_employe ADD CONSTRAINT FK_79E207201B65292 FOREIGN KEY (employe_id) REFERENCES employe (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE espece ADD CONSTRAINT FK_1A2A1B197A77B84 FOREIGN KEY (famille_id) REFERENCES famille (id)');
        $this->addSql('ALTER TABLE famille ADD CONSTRAINT FK_2473F2139291498C FOREIGN KEY (ordre_id) REFERENCES ordre (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE allee DROP FOREIGN KEY FK_771FD92A1B65292');
        $this->addSql('ALTER TABLE animal DROP FOREIGN KEY FK_6AAB231F2D191E7A');
        $this->addSql('ALTER TABLE animal DROP FOREIGN KEY FK_6AAB231F87998E');
        $this->addSql('ALTER TABLE animal DROP FOREIGN KEY FK_6AAB231F8B20F9C8');
        $this->addSql('ALTER TABLE animal DROP FOREIGN KEY FK_6AAB231F5A70E5B7');
        $this->addSql('ALTER TABLE animal DROP FOREIGN KEY FK_6AAB231F8D8B49F9');
        $this->addSql('ALTER TABLE animal_maladie DROP FOREIGN KEY FK_221B6D718E962C16');
        $this->addSql('ALTER TABLE animal_maladie DROP FOREIGN KEY FK_221B6D71B4B1C397');
        $this->addSql('ALTER TABLE animal_menu DROP FOREIGN KEY FK_3A287BA78E962C16');
        $this->addSql('ALTER TABLE animal_menu DROP FOREIGN KEY FK_3A287BA7CCD7E912');
        $this->addSql('ALTER TABLE cage DROP FOREIGN KEY FK_56A64E518E6975D2');
        $this->addSql('ALTER TABLE cage_employe DROP FOREIGN KEY FK_79E207205A70E5B7');
        $this->addSql('ALTER TABLE cage_employe DROP FOREIGN KEY FK_79E207201B65292');
        $this->addSql('ALTER TABLE espece DROP FOREIGN KEY FK_1A2A1B197A77B84');
        $this->addSql('ALTER TABLE famille DROP FOREIGN KEY FK_2473F2139291498C');
        $this->addSql('DROP TABLE adoptant');
        $this->addSql('DROP TABLE allee');
        $this->addSql('DROP TABLE animal');
        $this->addSql('DROP TABLE animal_maladie');
        $this->addSql('DROP TABLE animal_menu');
        $this->addSql('DROP TABLE cage');
        $this->addSql('DROP TABLE cage_employe');
        $this->addSql('DROP TABLE carnet_de_sante');
        $this->addSql('DROP TABLE employe');
        $this->addSql('DROP TABLE espece');
        $this->addSql('DROP TABLE famille');
        $this->addSql('DROP TABLE maladie');
        $this->addSql('DROP TABLE menu');
        $this->addSql('DROP TABLE ordre');
        $this->addSql('DROP TABLE origine');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
