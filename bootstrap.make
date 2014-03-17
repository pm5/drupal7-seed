; ----------------
; Generated makefile from http://drushmake.me
; Permanent URL: http://drushmake.me/file.php?token=c4abbdc277a7
; ----------------
;
; This is a working makefile - try it! Any line starting with a `;` is a comment.
  
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
projects[drupal][version] = 7

  
  
; Modules
; --------
projects[admin_menu][version] = 3.0-rc4
projects[admin_menu][type] = "module"
projects[ctools][version] = 1.3
projects[ctools][type] = "module"
projects[date][version] = 2.6
projects[date][type] = "module"
projects[devel][version] = 1.3
projects[devel][type] = "module"
projects[features][version] = 2.0-rc1
projects[features][type] = "module"
projects[libraries][version] = 2.1
projects[libraries][type] = "module"
projects[link][version] = 1.1
projects[link][type] = "module"
projects[advanced_help][version] = 1.0
projects[advanced_help][type] = "module"
projects[entity][version] = 1.1
projects[entity][type] = "module"
projects[entityreference][version] = 1.0
projects[entityreference][type] = "module"
projects[menu_block][version] = 2.3
projects[menu_block][type] = "module"
projects[menu_position][version] = 1.1
projects[menu_position][type] = "module"
projects[pathauto][version] = 1.2
projects[pathauto][type] = "module"
projects[token][version] = 1.5
projects[token][type] = "module"
projects[transliteration][version] = 3.1
projects[transliteration][type] = "module"
projects[zen][version] = 5.1
projects[zen][type] = "module"
projects[panels][version] = 3.3
projects[panels][type] = "module"
projects[views][version] = 3.7
projects[views][type] = "module"
projects[views_bulk_operations][version] = 3.1
projects[views_bulk_operations][type] = "module"

  

; Themes
; --------

  
  
; Libraries
; ---------
; No libraries were included

