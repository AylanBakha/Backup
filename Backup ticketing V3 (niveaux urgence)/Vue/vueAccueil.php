<?php $this->titre = "Ticketing"; ?>
<?php foreach ($billets as $billet):
    ?>
    <article>
        <header>
            <a href="<?= "index.php?action=billet&id=" . $billet['id'] ?>">
                <h1 class="titreBillet"><?= $billet['titre'] ?></h1>
            </a>
            <time><?= $billet['date'] ?></time>
        </header>
        <p><?= $billet['contenu'] ?></p>
        <p><?= $billet['lib'] ?></p>
        <p><?= $billet['delai'] ?></p>
    </article>
    <hr />
<?php endforeach; ?>
