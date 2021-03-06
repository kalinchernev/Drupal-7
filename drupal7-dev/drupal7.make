; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.

core = 7.x

; API version
; ------------
; Every makefile needs to declare its Drush Make API version. This version of
; drush make uses API version `2`.

api = 2

; Core project
; ------------
; In order for your makefile to generate a full Drupal site, you must include
; a core project. This is usually Drupal core, but you can also specify
; alternative core projects like Pressflow. Note that makefiles included with
; install profiles *should not* include a core project.

; Drupal 7.x. Requires the `core` property to be set to 7.x.
projects[drupal][version] = 7.41

; Modules
; --------

projects[admin_menu][version] = 3.0-rc5
projects[admin_menu][type] = "module"
projects[admin_menu][subdir] = "contrib"

projects[auto_nodetitle][version] = 1.0
projects[auto_nodetitle][type] = "module"
projects[auto_nodetitle][subdir] = "contrib"

projects[backup_migrate][version] = 3.1
projects[backup_migrate][type] = "module"
projects[backup_migrate][subdir] = "contrib"

projects[context][version] = 3.6
projects[context][type] = "module"
projects[context][subdir] = "contrib"

projects[captcha][version] = 1.3
projects[captcha][type] = "module"
projects[captcha][subdir] = "contrib"

projects[ckeditor][version] = 1.17
projects[ckeditor][type] = "module"
projects[ckeditor][subdir] = "contrib"

projects[ctools][version] = 1.9 
projects[ctools][type] = "module"
projects[ctools][subdir] = "contrib"

projects[date][version] = 2.9
projects[date][type] = "module"
projects[date][subdir] = "contrib"

projects[devel][version] = 1.5
projects[devel][type] = "module"
projects[devel][subdir] = "contrib"

projects[ds][version] = 2.12
projects[ds][type] = "module"
projects[ds][subdir] = "contrib"

projects[ds_bootstrap_layouts][version] = 3.1
projects[ds_bootstrap_layouts][type] = "module"
projects[ds_bootstrap_layouts][subdir] = "contrib"

projects[diff][version] = 3.2
projects[diff][type] = "module"
projects[diff][subdir] = "contrib"

projects[email][version] = 1.3
projects[email][type] = "module"
projects[email][subdir] = "contrib"

projects[email_registration][version] = 1.2
projects[email_registration][type] = "module"
projects[email_registration][subdir] = "contrib"

projects[entity][version] = 1.6
projects[entity][type] = "module"
projects[entity][subdir] = "contrib"

projects[entity_translation][version] = 1.0-beta4
projects[entity_translation][type] = "module"
projects[entity_translation][subdir] = "contrib"

projects[entityreference][version] = 1.1
projects[entityreference][type] = "module"
projects[entityreference][subdir] = "contrib"

projects[examples][version] = 1.x-dev
projects[examples][type] = "module"
projects[examples][subdir] = "contrib"

projects[fboauth][version] = 2.0-rc1
projects[fboauth][type] = "module"
projects[fboauth][subdir] = "contrib"

projects[features][version] = 2.7
projects[features][type] = "module"
projects[features][subdir] = "contrib"

projects[features_extra][version] = 1.0-beta1
projects[features_extra][type] = "module"
projects[features_extra][subdir] = "contrib"

projects[field_group][version] = 1.5
projects[field_group][type] = "module"
projects[field_group][subdir] = "contrib"

projects[file_entity][version] = 2.0-beta2
projects[file_entity][type] = "module"
projects[file_entity][subdir] = "contrib"

projects[flag][version] = 3.6
projects[flag][type] = "module"
projects[flag][subdir] = "contrib"

projects[gauth][version] = 1.4
projects[gauth][type] = "module"
projects[gauth][subdir] = "contrib"
projects[gauth][patch][] = https://www.drupal.org/files/issues/2309857-undefined_function_add_service.patch

projects[i18n][version] = 1.13
projects[i18n][type] = "module"
projects[i18n][subdir] = "contrib"

projects[inline_entity_form][version] = 1.6
projects[inline_entity_form][type] = "module"
projects[inline_entity_form][subdir] = "contrib"

projects[jquery_update][version] = 3.0-alpha3
projects[jquery_update][type] = "module"
projects[jquery_update][subdir] = "contrib"

projects[l10n_update][version] = 2.0
projects[l10n_update][type] = "module"
projects[l10n_update][subdir] = "contrib"

projects[libraries][version] = 2.2
projects[libraries][type] = "module"
projects[libraries][subdir] = "contrib"

projects[link][version] = 1.3
projects[link][type] = "module"
projects[link][subdir] = "contrib"

projects[media][version] = 2.x-dev
projects[media][type] = "module"
projects[media][subdir] = "contrib"

projects[module_filter][version] = 2.0
projects[module_filter][type] = "module"
projects[module_filter][subdir] = "contrib"

projects[oauth][version] = 3.2
projects[oauth][type] = "module"
projects[oauth][subdir] = "contrib"

projects[pathauto][version] = 1.3
projects[pathauto][type] = "module"
projects[pathauto][subdir] = "contrib"

projects[rules][version] = 2.9
projects[rules][type] = "module"
projects[rules][subdir] = "contrib"

projects[simplify][version] = 3.3
projects[simplify][type] = "module"
projects[simplify][subdir] = "contrib"

projects[strongarm][version] = 2.0
projects[strongarm][type] = "module"
projects[strongarm][subdir] = "contrib"

projects[title][version] = 1.0-alpha7
projects[title][type] = "module"
projects[title][subdir] = "contrib"

projects[token][version] = 1.6
projects[token][type] = "module"
projects[token][subdir] = "contrib"

projects[uuid][version] = 1.0-beta1
projects[uuid][type] = "module"
projects[uuid][subdir] = "contrib"

projects[uuid_features][version] = 1.0-alpha4
projects[uuid_features][type] = "module"
projects[uuid_features][subdir] = "contrib"

projects[variable][version] = 2.5
projects[variable][type] = "module"
projects[variable][subdir] = "contrib"

projects[vars][version] = 2.0-alpha10
projects[vars][type] = "module"
projects[vars][subdir] = "contrib"

projects[views][version] = 3.13
projects[views][type] = "module"
projects[views][subdir] = "contrib"

projects[workbench][version] = 1.2
projects[workbench][type] = "module"
projects[workbench][subdir] = "contrib"

projects[workbench_moderation][version] = 1.4
projects[workbench_moderation][type] = "module"
projects[workbench_moderation][subdir] = "contrib"

projects[views_bulk_operations][version] = 3.3
projects[views_bulk_operations][type] = "module"
projects[views_bulk_operations][subdir] = "contrib"

projects[views_bootstrap][version] = 3.1
projects[views_bootstrap][type] = "module"
projects[views_bootstrap][subdir] = "contrib"

projects[views_data_export][version] = 3.0-beta8
projects[views_data_export][type] = "module"
projects[views_data_export][subdir] = "contrib"


; Themes
; --------
projects[bootstrap][version] = 3.4
projects[bootstrap][type] = "theme"
projects[bootstrap][subdir] = "contrib"


; Libraries
; ---------
; supposed to be specific 1.0.5-beta
libraries[google-api-php-client][download][type] = "file"
libraries[google-api-php-client][download][url] = "https://github.com/google/google-api-php-client/archive/1.0.5-beta.zip"
