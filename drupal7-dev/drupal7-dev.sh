#!/bin/bash
# File: drupal7-dev.sh
# Compatibility: Targeted for any apt-get type of system (Ubuntu, Xubuntu, Mint, etc.)
#
# Drupal 7 standard installation, gets you ready to start developing and testing on D7.

# Clear the screen
clear
# Taking preferences
read -p "Drupal user 1 username: " username
read -p "Drupal user 1 password: " password
read -p "Drupal user 1 e-mail: " email
read -p "Target name of a database (I will create it): " db_name
read -p "Username accessing the database: " db_user
read -p "Password for this user: " db_pass

echo "And now it's time for Drush to do some magic ..."
drush make --force-complete --no-patch-txt --prepare-install drupal7.make . -y
drush site-install standard --db-url=mysql://${db_user}:${db_pass}@localhost:${db_port}/${db_name} --site-name=D7-dev --site-mail="${email}" --account-name="${username}" --account-pass="${password}" --account-mail="${email}" -y
drush pm-disable toolbar overlay dashboard color rdf shortcut -y
drush pm-enable admin_menu admin_menu_toolbar module_filter devel ctools context ds ds_extras ds_ui context_ui date date_popup date_views features ckeditor backup_migrate diff entity pathauto token taxonomy_manager jquery_update variable views views_ui strongarm uuid_features email -y
drush dl drush_extras -y
drush dl registry_rebuild -y
drush block-disable --delta=navigation -y

echo "Making sure files are ok as well .."
cd sites/default
chmod -R 777 files
chmod 444 settings.php
drush cc all -y

echo "Happy Drupal 7 coding! "
