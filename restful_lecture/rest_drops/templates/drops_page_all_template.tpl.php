<?php // dpm($all_drops);          ?>
<div>
    <ul class="action-links">
        <li><a href="/admin/drops/create"><?php echo t("Add new BLUE drop!"); ?></a></li>
    </ul>
    <table style="width:100%">
        <thead>
        <th><?php echo t("Drop"); ?></th>
        <th><?php echo t("Kill it"); ?></th>
        </thead>
        <?php foreach ($all_drops as $drop) : ?>
          <tr>
              <td><input type="text" value="<?php echo $drop->name; ?>" class="drop-name-update" data-drop-id="<?php echo $drop->_id; ?>" title="Click and edit me!" /></td> 
              <td><a href="/admin/drops/<?php echo $drop->_id; ?>/delete">X</a></td>
          </tr>
        <?php endforeach; ?>
    </table>
</div>

