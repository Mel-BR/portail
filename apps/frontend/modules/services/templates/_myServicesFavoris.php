<div id="my_services">
  <h1>Mes Services Favoris</h1>
  <?php if($services && $services->count() > 0): ?>
    <?php foreach ($services as $service):?>
     <a href=" <?php echo $service->getService()->getUrl()?>"> <b><?php echo $service->getService()->getNom() ?></b> </a>
     <br>
    <?php endforeach; ?>
  <?php else: ?>
    <p>Vous n'avez aucun services favoris.</p>
  <?php endif; ?>
</div>