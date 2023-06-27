#!/bin/sh

if [ -n "$1" ]; then
    FILES_TO_CONVERT="$@"
else
    FILES_TO_CONVERT="$(find . -name '*.py')"
fi

for f in $FILES_TO_CONVERT; do
    perl -i -0 \
    -pe "s/import gconf\n/from gi.repository import GConf\n/g;" \
    -pe "s/gconf\./GConf\./g;" \
    -pe "s/GConf\.client_get_default/GConf.Client.get_default/g;" \
    -pe "s/GConf\.CLIENT_/GConf.ClientPreloadType./g;" \
    -pe "s/GConf\.VALUE_/GConf.ValueType./g;" \
    -pe "s/gconf_client.notify_add\('\/desktop\/sugar\/collaboration\/publish_gadget',/return;gconf_client.notify_add\('\/desktop\/sugar\/collaboration\/publish_gadget',/g;" \
\
    -pe "s/import pygtk/import gi/g;" \
    -pe "s/pygtk.require\('2.0'\)/gi.require_version\('Gtk', '3.0'\)/g;" \
    -pe "s/pygtk.require\(\"2.0\"\)/gi.require_version\(\"Gtk\", \"3.0\"\)/g;" \
    -pe "s/import gtk\n/from gi.repository import Gtk\n/g;" \
    -pe "s/(?<!\.)gtk\./Gtk\./g;" \
    -pe "s/Gtk.ACCEL_/Gtk.AccelFlags./g;" \
    -pe "s/Gtk.ARROW_/Gtk.ArrowType./g;" \
    -pe "s/Gtk.ASSISTANT_PAGE_/Gtk.AssistantPageType./g;" \
    -pe "s/Gtk.BUTTONBOX_/Gtk.ButtonBoxStyle./g;" \
    -pe "s/Gtk.BUTTONS_/Gtk.ButtonsType./g;" \
    -pe "s/Gtk.CELL_RENDERER_MODE_/Gtk.CellRendererMode./g;" \
    -pe "s/Gtk.CELL_RENDERER_FOCUSED/Gtk.CellRendererState.FOCUSED/g;" \
    -pe "s/Gtk.CELL_RENDERER_INSENSITIVE/Gtk.CellRendererState.INSENSITIVE/g;" \
    -pe "s/Gtk.CELL_RENDERER_PRELIT/Gtk.CellRendererState.PRELIT/g;" \
    -pe "s/Gtk.CELL_RENDERER_SORTED/Gtk.CellRendererState.SORTED/g;" \
    -pe "s/Gtk.CELL_RENDERER_SELECTED/Gtk.CellRendererState.SELECTED/g;" \
    -pe "s/Gtk.CORNER_/Gtk.CornerType./g;" \
    -pe "s/Gtk.DIALOG_/Gtk.DialogFlags./g;" \
    -pe "s/Gtk.ENTRY_ICON_/Gtk.EntryIconPosition./g;" \
    -pe "s/Gtk.EXPAND/Gtk.AttachOptions.EXPAND/g;" \
    -pe "s/Gtk.FALSE/False/g;" \
    -pe "s/Gtk.FILE_CHOOSER_ACTION_/Gtk.FileChooserAction./g;" \
    -pe "s/Gtk.FILL/Gtk.AttachOptions.FILL/g;" \
    -pe "s/Gtk.ICON_LOOKUP_/Gtk.IconLookupFlags./g;" \
    -pe "s/Gtk.ICON_SIZE_/Gtk.IconSize./g;" \
    -pe "s/Gtk.IMAGE_/Gtk.ImageType./g;" \
    -pe "s/Gtk.JUSTIFY_/Gtk.Justification./g;" \
    -pe "s/Gtk.MESSAGE_/Gtk.MessageType./g;" \
    -pe "s/Gtk.MOVEMENT_/Gtk.MovementStep./g;" \
    -pe "s/Gtk.ORIENTATION_/Gtk.Orientation./g;" \
    -pe "s/Gtk.POLICY_/Gtk.PolicyType./g;" \
    -pe "s/Gtk.POS_/Gtk.PositionType./g;" \
    -pe "s/Gtk.RECENT_FILTER_/Gtk.RecentFilterFlags./g;" \
    -pe "s/Gtk.RECENT_SORT_/Gtk.RecentSortType./g;" \
    -pe "s/Gtk.RELIEF_/Gtk.ReliefStyle./g;" \
    -pe "s/Gtk.RESPONSE_/Gtk.ResponseType./g;" \
    -pe "s/Gtk.SELECTION_/Gtk.SelectionMode./g;" \
    -pe "s/Gtk.SHADOW_/Gtk.ShadowType./g;" \
    -pe "s/Gtk.SHADOW_NONE/Gtk.ShadowType.NONE/g;" \
    -pe "s/Gtk.SHRINK/Gtk.AttachOptions.SHRINK/g;" \
    -pe "s/Gtk.SIZE_GROUP_/Gtk.SizeGroupMode./g;" \
    -pe "s/Gtk.SORT_/Gtk.SortType./g;" \
    -pe "s/Gtk.STATE_/Gtk.StateType./g;" \
    -pe "s/Gtk.TARGET_/Gtk.TargetFlags./g;" \
    -pe "s/Gtk.TEXT_DIR_/Gtk.TextDirection./g;" \
    -pe "s/Gtk.TEXT_SEARCH_/Gtk.TextSearchFlags./g;" \
    -pe "s/Gtk.TEXT_WINDOW_/Gtk.TextWindowType./g;" \
    -pe "s/Gtk.TOOLBAR_/Gtk.ToolbarStyle./g;" \
    -pe "s/Gtk.TREE_MODEL_/Gtk.TreeModelFlags./g;" \
    -pe "s/Gtk.TREE_VIEW_COLUMN_/Gtk.TreeViewColumnSizing./g;" \
    -pe "s/Gtk.TREE_VIEW_DROP_/Gtk.TreeViewDropPosition./g;" \
    -pe "s/Gtk.TRUE/True/g;" \
    -pe "s/Gtk.WINDOW_/Gtk.WindowType./g;" \
    -pe "s/Gtk.DEST_DEFAULT_/Gtk.DestDefaults./g;" \
    -pe "s/Gtk.WIN_POS_/Gtk.WindowPosition./g;" \
    -pe "s/Gtk.WRAP_/Gtk.WrapMode./g;" \
    -pe "s/Gtk.UI_MANAGER_/Gtk.UIManagerItemType./g;" \
    -pe "s/Gtk.accel_map_/Gtk.AccelMap./g;" \
    -pe "s/Gtk.settings_get_/Gtk.Settings.get_/g;" \
    -pe "s/Gtk.icon_theme_get_default/Gtk.IconTheme.get_default/g;" \
    -pe "s/Gtk.recent_manager_get_default/Gtk.RecentManager.get_default/g;" \
    -pe "s/Gtk.image_new_from_stock/Gtk.Image.new_from_stock/g;" \
    -pe "s/Gtk.image_new_from_icon_name/Gtk.Image.new_from_icon_name/g;" \
    -pe "s/Gtk.window_set_default_icon_name/Gtk.Window.set_default_icon_name/g; " \
    -pe "s/Gtk.combo_box_new_text/Gtk.ComboBoxText/g;" \
    -pe "s/Gtk.keysyms\./Gdk.KEY_/g;" \
    -pe "s/set_flags\(Gtk.CAN_DEFAULT\)/set_can_default\(True\)/g;" \
    -pe "s/.flags\(\) & Gtk.MAPPED/.get_mapped\(\)/g;" \
    -pe "s/.flags\(\) & Gtk.REALIZED/.get_realized\(\)/g;" \
    -pe "s/\.window\.set_type_hint/.set_type_hint/g;" \
    -pe "s/\.window\.set_skip_taskbar_hint/.set_skip_taskbar_hint/g;" \
    -pe "s/\.window\.set_transient_for/.set_transient_for/g;" \
    -pe "s/Gtk.Alignment\(/Gtk.Alignment.new\(/g;" \
    -pe "#s/Gtk.Window.__init__\(self\)/Gtk.Window.__init__\(Gtk.WindowType.TOPLEVEL\)/g;" \
    -pe "s/\.child([^_A-Za-z])/.get_child\(\)\1/g;" \
\
    -pe "s/column.pack_start\(([^,\)]*)\)/column.pack_start\(\1, True\)/g;" \
    -pe "s/pack_start\(([^,\)]*)\)/pack_start\(\1, True, True, 0\)/g;" \
    -pe "s/pack_start\(([^,]*), fill=([^,\)]*)\)/pack_start\(\1, True, \2, 0\)/g;" \
    -pe "s/pack_start\(([^,]*), expand=([^,\)]*)\)/pack_start\(\1, \2, True, 0\)/g;" \
    -pe "s/pack_start\(([^,]*),(\s*)padding=([A-Za-z0-9._]*)\)/pack_start\(\1,\2True, True,\2\3\)/g;" \
    -pe "s/column.pack_end\(([^,\)]*)\)/column.pack_end\(\1, True\)/g;" \
    -pe "s/pack_end\(([^,\)]*)\)/pack_end\(\1, True, True, 0\)/g;" \
    -pe "s/pack_end\(([^,]*), fill=([^,\)]*)\)/pack_end\(\1, True, \2, 0\)/g;" \
    -pe "s/pack_end\(([^,]*), expand=([^,\)]*)\)/pack_end\(\1, \2, True, 0\)/g;" \
    -pe "s/pack_end\(([^,]*),(\s*)padding=([A-Za-z0-9._]*)\)/pack_end\(\1,\2True, True,\2\3\)/g;" \
    -pe "#s/Gtk.HBox\(\)/Gtk.HBox\(False, 0\)/g;" \
    -pe "#s/Gtk.VBox\(\)/Gtk.VBox\(False, 0\)/g;" \
    -pe "s/Gtk.Label\s*\(([^,\)]+)\)/Gtk.Label\(label=\1\)/g;" \
    -pe "s/Gtk.AccelLabel\s*\(([^,\)]+)\)/Gtk.AccelLabel\(label=\1\)/g;" \
    -pe "s/Gtk.((?:Accel)?Label)\(label=label=/Gtk.\1\(label=/g;" \
    -pe "s/len\(self._content.get_children\(\)\) > 0/self._content.get_children\(\)/g;" \
    -pe "s/len\(self.menu.get_children\(\)\) > 0/self.menu.get_children\(\)/g;" \
    -pe "s/import gobject\n/from gi.repository import GObject\n/g;" \
    -pe "s/Gtk\..*\.__init__/gobject.GObject.__init__/g;" \
\
    -pe "s/rsvg.Handle\s*\(data=([^,\)]+)\)/Rsvg.Handle.new_from_data(\1)/g;" \
\
    -pe "s/from gtk import gdk\n/from gi.repository import Gdk\n/g;" \
    -pe "s/import gtk.gdk as gdk\n/from gi.repository import Gdk\n/g;" \
    -pe "s/Gtk.gdk.x11_/GdkX11.x11_/g;" \
    -pe "s/Gtk.gdk\./Gdk\./g;" \
    -pe "s/(?<!\.)gdk\./Gdk\./g;" \
    -pe "s/Gdk.screen_width/Gdk.Screen.width/g;" \
    -pe "s/Gdk.screen_height/Gdk.Screen.height/g;" \
    -pe "s/Gdk.screen_get_default/Gdk.Screen.get_default/g;" \
    -pe "s/Gdk.display_get_default/Gdk.Display.get_default/g;" \
    -pe "s/screen_, x_, y_, modmask = display.get_pointer\(\)/x_, y_, modmask = display.get_pointer\(None\)/g;" \
    -pe "s/Gdk.WINDOW_TYPE_HINT_/Gdk.WindowTypeHint./g;" \
    -pe "s/Gdk.SHIFT_MASK/Gdk.ModifierType.SHIFT_MASK/g;" \
    -pe "s/Gdk.LOCK_MASK/Gdk.ModifierType.LOCK_MASK/g;" \
    -pe "s/Gdk.CONTROL_MASK/Gdk.ModifierType.CONTROL_MASK/g;" \
    -pe "s/Gdk.MOD1_MASK/Gdk.ModifierType.MOD1_MASK/g;" \
    -pe "s/Gdk.MOD2_MASK/Gdk.ModifierType.MOD2_MASK/g;" \
    -pe "s/Gdk.MOD3_MASK/Gdk.ModifierType.MOD3_MASK/g;" \
    -pe "s/Gdk.MOD4_MASK/Gdk.ModifierType.MOD4_MASK/g;" \
    -pe "s/Gdk.MOD5_MASK/Gdk.ModifierType.MOD5_MASK/g;" \
    -pe "s/Gdk.BUTTON1_MASK/Gdk.ModifierType.BUTTON1_MASK/g;" \
    -pe "s/Gdk.BUTTON2_MASK/Gdk.ModifierType.BUTTON2_MASK/g;" \
    -pe "s/Gdk.BUTTON3_MASK/Gdk.ModifierType.BUTTON3_MASK/g;" \
    -pe "s/Gdk.BUTTON4_MASK/Gdk.ModifierType.BUTTON4_MASK/g;" \
    -pe "s/Gdk.BUTTON5_MASK/Gdk.ModifierType.BUTTON5_MASK/g;" \
    -pe "s/Gdk.RELEASE_MASK/Gdk.ModifierType.RELEASE_MASK/g;" \
    -pe "s/Gdk.MODIFIER_MASK/Gdk.ModifierType.MODIFIER_MASK/g;" \
    -pe "s/Gdk.([A-Z_0-9]*)_MASK/Gdk.EventMask.\1_MASK/g;" \
    -pe "s/Gdk.VISIBILITY_FULLY_OBSCURED/Gdk.VisibilityState.FULLY_OBSCURED/g;" \
    -pe "s/Gdk.NOTIFY_ANCESTOR/Gdk.NotifyType.ANCESTOR/g;" \
    -pe "s/Gdk.NOTIFY_INFERIOR/Gdk.NotifyType.INFERIOR/g;" \
    -pe "s/Gdk.NOTIFY_NONLINEAR_VIRTUAL/Gdk.NotifyType.NONLINEAR_VIRTUAL/g;" \
    -pe "s/Gdk.NOTIFY_NONLINEAR/Gdk.NotifyType.NONLINEAR/g;" \
    -pe "s/Gdk.NOTIFY_UNKNOWN/Gdk.NotifyType.UNKNOWN/g;" \
    -pe "s/Gdk.NOTIFY_VIRTUAL/Gdk.NotifyType.VIRTUAL/g;" \
    -pe "s/Gdk.PROP_MODE_APPEND/Gdk.PropMode.APPEND/g;" \
    -pe "s/Gdk.PROP_MODE_PREPEND/Gdk.PropMode.PREPEND/g;" \
    -pe "s/Gdk.PROP_MODE_REPLACE/Gdk.PropMode.REPLACE/g;" \
    -pe "s/Gdk.BUTTON_PRESS/Gdk.EventType.BUTTON_PRESS/g;" \
    -pe "s/Gdk.ACTION_/Gdk.DragAction./g;" \
    -pe "s/Gdk.GRAB_/Gdk.GrabStatus./g;" \
    -pe "s/Gdk.SCROLL_(DOWN|LEFT|RIGHT|UP)/Gdk.ScrollDirection.\1/g;" \
    -pe "s/Gdk.([A-Z]+_(PTR|CURSOR))/Gdk.CursorType.\1/g;" \
    -pe "s/Gdk.(CROSSHAIR)/Gdk.CursorType.\1/g;" \
    -pe "s/Gdk.(WATCH)/Gdk.CursorType.\1/g;" \
    -pe "s/Gdk.(ARROW)/Gdk.CursorType.\1/g;" \
    -pe "s/Gdk.(CLOCK)/Gdk.CursorType.\1/g;" \
    -pe "s/Gdk.WINDOW_STATE_(ABOVE|BELOW|FOCUSED|FULLSCREEN|ICONIFIED|MAXIMIZED|STICKY|WITHDRAWN)/Gdk.WindowState.\1/g;" \
    -pe "s/Gdk.Cursor\s*\(/Gdk.Cursor.new\(/g;" \
    -pe "s/#Gdk.Rectangle\(([^,\)]*), ([^,\)]*), ([^,\)]*), ([^,\)]*)\)/\1, \2, \3, \4/g;" \
    -pe "s/Gdk.Rectangle//g;" \
    -pe "s/intersection = child_rect.intersect/intersects_, intersection = child_rect.intersect/g;" \
    -pe "s/event.state/event.get_state\(\)/g;" \
\
    -pe "s/Gdk.pixbuf_/GdkPixbuf.Pixbuf./g;" \
    -pe "s/Gdk.Pixbuf/GdkPixbuf.Pixbuf/g;" \
    -pe "s/Gdk.INTERP_/GdkPixbuf.InterpType./g;" \
    -pe "s/Gdk.COLORSPACE_RGB/GdkPixbuf.Colorspace.RGB/g;" \
\
    -pe "s/import pango\n/from gi.repository import Pango\n/g;" \
    -pe "s/pango\./Pango\./g;" \
    -pe "s/Pango.ALIGN_/Pango.Alignment./g;" \
    -pe "s/Pango.ELLIPSIZE_/Pango.EllipsizeMode./g;" \
    -pe "s/Pango.STYLE_/Pango.Style./g;" \
    -pe "s/Pango.UNDERLINE_/Pango.Underline./g;" \
    -pe "s/Pango.WEIGHT_/Pango.Weight./g;" \
    -pe "s/Pango.WRAP_/Pango.WrapMode./g;" \
    -pe "s/Pango.TAB_/Pango.TabAlign./g;" \
\
    -pe "s/import atk\n/from gi.repository import Atk\n/g;" \
    -pe "s/atk\./Atk\./g;" \
    -pe "s/Atk.HYPERLINK_/Atk.HyperlinkStateFlags./g;" \
    -pe "s/Atk.KEY_EVENT_/Atk.KeyEventType./g;" \
    -pe "s/Atk.LAYER_/Atk.Layer./g;" \
    -pe "s/Atk.RELATION_/Atk.RelationType./g;" \
    -pe "s/Atk.ROLE_/Atk.Role./g;" \
    -pe "s/Atk.STATE_/Atk.StateType./g;" \
    -pe "s/Atk.TEXT_ATTR_/Atk.TextAttribute./g;" \
    -pe "s/Atk.TEXT_BOUNDARY_/Atk.TextBoundary./g;" \
    -pe "s/Atk.TEXT_CLIP_/Atk.TextClipType./g;" \
\
    -pe "s/import gio\n/from gi.repository import Gio\n/g;" \
    -pe "s/gio\./Gio\./g;" \
    -pe "s/Gio\.File\(uri=/Gio\.File\.new_for_uri\(/g;" \
    -pe "s/Gio\.File\(path=/Gio\.File\.new_for_path\(/g;" \
    -pe "s/Gio.FILE_COPY_/Gio.FileCopyFlags./g;" \
    -pe "s/Gio.FILE_CREATE_/Gio.FileCreateFlags./g;" \
    -pe "s/Gio.FILE_MONITOR_EVENT_/Gio.FileMonitorEvent./g;" \
    -pe "s/Gio.FILE_MONITOR_/Gio.FileMonitorFlags./g;" \
    -pe "s/Gio.FILE_TYPE_/Gio.FileType./g;" \
    -pe "s/Gio.FILE_QUERY_INFO_/Gio.FileQueryInfoFlags./g;" \
    -pe "s/Gio.MOUNT_MOUNT_/Gio.MountMountFlags./g;" \
    -pe "s/Gio.MOUNT_OPERATION_/Gio.MountOperationResult./g;" \
    -pe "s/Gio.MOUNT_UNMOUNT_/Gio.MountUnmountFlags./g;" \
    -pe "s/Gio.OUTPUT_STREAM_SPLICE_/Gio.OutputStreamSpliceFlags./g;" \
    -pe "s/Gio.vfs_/Gio.Vfs./g;" \
\
    -pe "s/import glib\n/from gi.repository import GLib\n/g;" \
    -pe "s/(?<!\.)glib\./GLib\./g;" \
    -pe "s/GLib.IO_(ERR|HUP|IN|NVAL|OUT|PRI)/GLib.IOCondition.\1/g;" \
    -pe "s/GLib.IO_FLAG_/GLib.IOFlags./g;" \
    -pe "s/GLib.OPTION_FLAG_/GLib.OptionFlags./g;" \
    -pe "s/GLib.SPAWN_/GLib.SpawnFlags./g;" \
    -pe "s/GLib.USER_DIRECTORY_/GLib.UserDirectory.DIRECTORY_/g;" \
\
    -pe "s/(?<!\.)gobject\./GObject\./g;" \
    -pe "s/GObject.SIGNAL_/GObject.SignalFlags./g;" \
    -pe "s/GObject.TYPE_NONE/None/g;" \
\
    -pe "s/import hippo\n/from gi.repository import Hippo\n/g;" \
    -pe "s/hippo\./Hippo\./g;" \
    -pe "s/Hippo\..*\.__init__/gobject.GObject.__init__/g;" \
    -pe "s/Hippo.PACK_/Hippo.PackFlags./g;" \
    -pe "s/Hippo.ORIENTATION_/Hippo.Orientation./g;" \
    -pe "#s/insert_sorted\(([^,\)]*), ([^,\)]*), ([^,\)]*)\)/insert_sorted\(\1, \2, \3, None\)/g;" \
    -pe "s/self\._box\.insert_sorted/#self\._box\.insert_sorted/g;" \
    -pe "s/self._box.append\(([^,\)]*)\)/self._box.append\(\1, 0\)/g;" \
    -pe "s/self.append\(self._buddy_icon\)/self.append\(self._buddy_icon, 0\)/g;" \
    -pe "s/self._box.sort\(([^,\)]*)\)/self._box.sort\(\1, None\)/g;" \
\
    -pe "s/import wnck\n/from gi.repository import Wnck\n/g;" \
    -pe "s/wnck\./Wnck\./g;" \
    -pe "s/Wnck.screen_get_default/Wnck.Screen.get_default/g;" \
    -pe "s/Wnck.WINDOW_/Wnck.WindowType./g;" \
\
    -pe "s/from sugar import _sugarext\n/from gi.repository import SugarExt\n/g;" \
    -pe "s/_sugarext\.ICON_ENTRY_/SugarExt.SexyIconEntryPosition./g;" \
    -pe "s/_sugarext\.IconEntry/SugarExt.SexyIconEntry/g;" \
    -pe "s/_sugarext\.SMClientXSMP/SugarExt.GsmClientXSMP/g;" \
    -pe "s/_sugarext\.VolumeAlsa/SugarExt.AcmeVolumeAlsa/g;" \
    -pe "s/_sugarext\./SugarExt\./g;" \
\
    -pe "s/import gtksourceview2\n/from gi.repository import GtkSource\n/g;" \
    -pe "s/import gtksourceview2 as gsv\n/from gi.repository import GtkSource\n/g;" \
    -pe "s/gtksourceview2\./GtkSource\./g;" \
    -pe "s/gsv\./GtkSource\./g;" \
    -pe "s/GtkSource.DRAW_SPACES_/GtkSource.DrawSpacesFlags./g;" \
    -pe "s/GtkSource.SMART_HOME_END_/GtkSource.SmartHomeEndType./g;" \
    -pe "s/GtkSource.style_scheme_manager_get_default/GtkSource.StyleSchemeManager.get_default/g;" \
    -pe "s/GtkSource.language_manager_get_default/GtkSource.LanguageManager.get_default/g;" \
\
    -pe "#s/import cairo\n/from gi.repository import cairo\n/g;" \
\
    -pe "s/SugarExt.xsmp_init\(\)/'mec'/g;" \
    -pe "s/SugarExt.xsmp_run\(\)/#SugarExt.xsmp_run\(\)/g;" \
    -pe "s/SugarExt.session_create_global\(\)/None #SugarExt.session_create_global\(\)/g;" \
    -pe "s/self.session.start\(\)/return #self.session.start\(\)/g;" \
\
    -pe "s/self._box.sort\(self._layout.compare_activities, None\)/pass #self._box.sort(self._layout.compare_activities, None)/g;" \
    -pe "s/attach_points = info.get_attach_points/has_attach_points_, attach_points = info.get_attach_points/g;" \
    -pe "s/attach_points\[0\]\[0\]/attach_points\[0\].x/g;" \
    -pe "s/attach_points\[0\]\[1\]/attach_points\[0\].y/g;" \
    -pe "s/has_attach_points_/return 0,0;has_attach_points_/g;" \
    -pe "s/gobject.GObject.__init__\(self, self._model_filter\)/gobject.GObject.__init__\(self, model=self._model_filter\)/g;" \
    -pe "s/self._model_filter.set_visible_func/return;self._model_filter.set_visible_func/g;" \
    -pe "s/buddies_column.set_cell_data_func/return;buddies_column.set_cell_data_func/g;" \
    -pe "s/Hippo\.cairo_surface_from_gdk_pixbuf/SugarExt\.cairo_surface_from_pixbuf/g;" \
\
    -pe "s/import pynotify\n/from gi.repository import Notify\n/g;" \
    -pe "s/pynotify\./Notify\./g;" \
\
    -pe "s/import webkit\n/from gi.repository import WebKit\n/g;" \
    -pe "s/import clutter\n/from gi.repository import Clutter\n/g;" \
    -pe "s/from clutter import cogl\n/from gi.repository import Cogl\n/g;" \
    -pe "s/(?<!\.)clutter\./Clutter\./g;" \
    -pe "s/(?<!\.)cogl\./Cogl\./g;" \
    -pe "s/Clutter.ACTOR_/Clutter.ActorFlags./g;" \
    -pe "s/Clutter.ALLOCATION_/Clutter.AllocationFlags./g;" \
    -pe "s/Clutter.BIND_/Clutter.BindCoordinate./g;" \
    -pe "s/Clutter.BIN_ALIGNMENT_/Clutter.BinAlignment./g;" \
    -pe "s/Clutter.BOX_ALIGNMENT_/Clutter.BoxAlignment./g;" \
    -pe "s/Clutter.DRAG_/Clutter.DragAxis./g;" \
    -pe "s/Clutter.EASE_/Clutter.AnimationMode./g;" \
    -pe "s/Clutter.FEATURE_/Clutter.FeatureFlags./g;" \
    -pe "s/Clutter.FLOW_/Clutter.FLOW_ORIENTATION./g;" \
    -pe "s/Clutter.FONT_/Clutter.FontFlags./g;" \
    -pe "s/Clutter.GRAVITY_/Clutter.Gravity./g;" \
    -pe "s/Clutter.INTERPOLATION/Clutter.Interpolation./g;" \
    -pe "s/Clutter.LINEAR/Clutter.AnimationMode.LINEAR/g;" \
    -pe "s/Clutter.PATH_/Clutter.PathNodeType./g;" \
    -pe "s/Clutter.PICK_/Clutter.PickMode./g;" \
    -pe "s/Clutter.REQUEST_/Clutter.RequestMode./g;" \
    -pe "s/Clutter.ROTATE_/Clutter.RotateDirection./g;" \
    -pe "s/Clutter.SCRIPT_/Clutter.ScriptError./g;" \
    -pe "s/Clutter.STAGE_STATE_/Clutter.StageState./g;" \
    -pe "s/Clutter.TABLE_ALIGNMENT_/Clutter.TableAlignment./g;" \
    -pe "s/Clutter.TEXTURE_ERROR_/Clutter.TextureError./g;" \
    -pe "s/Clutter.TEXTURE_/Clutter.TextureFlags./g;" \
    -pe "s/Clutter.TEXT_/Clutter.TextDirection./g;" \
    -pe "s/Clutter.TIMELINE_/Clutter.TimelineDirection./g;" \
    -pe "s/Clutter.UNIT_/Clutter.UnitType./g;" \
    -pe "s/Clutter.X_AXIS/Clutter.RotateAxis.X_AXIS/g;" \
    -pe "s/Clutter.Y_AXIS/Clutter.RotateAxis.Y_AXIS/g;" \
    -pe "s/Clutter.Z_AXIS/Clutter.RotateAxis.Z_AXIS/g;" \
    -pe "s/Clutter.ENTER/Clutter.EventType.ENTER/g;" \
    -pe "s/Clutter.LEAVE/Clutter.EventType.LEAVE/g;" \
    -pe "s/Clutter.BUTTON_PRESS/Clutter.EventType.BUTTON_PRESS/g;" \
    -pe "s/Clutter.BUTTON_RELEASE/Clutter.EventType.BUTTON_RELEASE/g;" \
    -pe "s/Clutter.KEY_PRESS/Clutter.EventType.KEY_PRESS/g;" \
    -pe "s/Clutter.KEY_RELEASE/Clutter.EventType.KEY_RELEASE/g;" \
    -pe "s/Clutter.SCROLL/Clutter.EventType.SCROLL/g;" \
    -pe "s/Clutter.DELETE/Clutter.EventType.DELETE/g;" \
    -pe "s/Clutter.CLIENT_MESSAGE/Clutter.EventType.CLIENT_MESSAGE/g;" \
    -pe "s/Clutter.DESTROY_NOTIFY/Clutter.EventType.DESTROY_NOTIFY/g;" \
    -pe "s/Clutter.STAGE_STATE/Clutter.EventType.STAGE_STATE/g;" \
    -pe "s/Clutter.MOTION/Clutter.EventType.MOTION/g;" \
    -pe "s/Clutter.BUTTON1_MASK/Clutter.ModifierType.BUTTON1_MASK/g;" \
    -pe "s/Clutter.BUTTON2_MASK/Clutter.ModifierType.BUTTON2_MASK/g;" \
    -pe "s/Clutter.BUTTON3_MASK/Clutter.ModifierType.BUTTON3_MASK/g;" \
    -pe "s/Clutter.BUTTON4_MASK/Clutter.ModifierType.BUTTON4_MASK/g;" \
    -pe "s/Clutter.BUTTON5_MASK/Clutter.ModifierType.BUTTON5_MASK/g;" \
    -pe "s/Clutter.CONTROL_MASK/Clutter.ModifierType.CONTROL_MASK/g;" \
    -pe "s/Clutter.HYPER_MASK/Clutter.ModifierType.HYPER_MASK/g;" \
    -pe "s/Clutter.LOCK_MASK/Clutter.ModifierType.LOCK_MASK/g;" \
    -pe "s/Clutter.META_MASK/Clutter.ModifierType.META_MASK/g;" \
    -pe "s/Clutter.MOD1_MASK/Clutter.ModifierType.MOD1_MASK/g;" \
    -pe "s/Clutter.MOD2_MASK/Clutter.ModifierType.MOD2_MASK/g;" \
    -pe "s/Clutter.MOD3_MASK/Clutter.ModifierType.MOD3_MASK/g;" \
    -pe "s/Clutter.MOD4_MASK/Clutter.ModifierType.MOD4_MASK/g;" \
    -pe "s/Clutter.MOD5_MASK/Clutter.ModifierType.MOD5_MASK/g;" \
    -pe "s/Clutter.MODIFIER_MASK/Clutter.ModifierType.MODIFIER_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_13_MASK/Clutter.ModifierType.MODIFIER_RESERVED_13_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_14_MASK/Clutter.ModifierType.MODIFIER_RESERVED_14_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_15_MASK/Clutter.ModifierType.MODIFIER_RESERVED_15_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_16_MASK/Clutter.ModifierType.MODIFIER_RESERVED_16_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_17_MASK/Clutter.ModifierType.MODIFIER_RESERVED_17_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_18_MASK/Clutter.ModifierType.MODIFIER_RESERVED_18_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_19_MASK/Clutter.ModifierType.MODIFIER_RESERVED_19_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_20_MASK/Clutter.ModifierType.MODIFIER_RESERVED_20_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_21_MASK/Clutter.ModifierType.MODIFIER_RESERVED_21_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_22_MASK/Clutter.ModifierType.MODIFIER_RESERVED_22_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_23_MASK/Clutter.ModifierType.MODIFIER_RESERVED_23_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_24_MASK/Clutter.ModifierType.MODIFIER_RESERVED_24_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_25_MASK/Clutter.ModifierType.MODIFIER_RESERVED_25_MASK/g;" \
    -pe "s/Clutter.MODIFIER_RESERVED_29_MASK/Clutter.ModifierType.MODIFIER_RESERVED_29_MASK/g;" \
    -pe "s/Clutter.RELEASE_MASK/Clutter.ModifierType.RELEASE_MASK/g;" \
    -pe "s/Clutter.SHIFT_MASK/Clutter.ModifierType.SHIFT_MASK/g;" \
    -pe "s/Clutter.SUPER_MASK/Clutter.ModifierType.SUPER_MASK/g;" \
\
    -pe "s/import gst\n/from gi.repository import Gst\n/g;" \
    -pe "s/(?<!\.)gst\./Gst\./g;" \
    -pe "s/Gst.element_factory_find/Gst.ElementFactory.find/g;" \
    -pe "s/Gst.element_factory_make/Gst.ElementFactory.make/g;" \
    -pe "s/Gst.caps_from_string/Gst.Caps.from_string/g;" \
    -pe "s/Gst.STATE_CHANGE_/Gst.StateChangeReturn./g;" \
    -pe "s/Gst.STATE_/Gst.State./g;" \
    -pe "s/Gst.MESSAGE_/Gst.MessageType./g;" \
    -pe "s/Gst.FORMAT_/Gst.Format./g;" \
    -pe "s/Gst.SEEK_FLAG_/Gst.SeekFlags./g;" \
    -pe "s/Gst.SEEK_TYPE_/Gst.SeekType./g;" \
    -pe "s/Gst.LEVEL_/Gst.DebugLevel./g;" \
    -pe "s/Gst.URI_/Gst.URIType./g;" \
    -pe "s/Gst.element_make_from_uri/Gst.Element.make_from_uri/g;" \
    -pe "s/Gst.event_new_seek/Gst.Event.new_seek/g;" \
    -pe "s/Gst.GhostPad\(/Gst.GhostPad.new\(/g;" \
    $f
done


