module geany_d_binding.geany.keybindings;

import geany_d_binding.geany.types;
import gdk.Gdk: GdkModifierType, GDestroyNotify;
import gtk.Widget: GtkWidget;

extern(System) nothrow:

/** Keybinding group IDs for use with keybindings_send_command(). */
/* These IDs are used to lookup a group. */
enum GeanyKeyGroupID
{
    GEANY_KEY_GROUP_FILE,           /**< Group. */
    GEANY_KEY_GROUP_PROJECT,        /**< Group. */
    GEANY_KEY_GROUP_EDITOR,         /**< Group. */
    GEANY_KEY_GROUP_CLIPBOARD,      /**< Group. */
    GEANY_KEY_GROUP_SELECT,         /**< Group. */
    GEANY_KEY_GROUP_FORMAT,         /**< Group. */
    GEANY_KEY_GROUP_INSERT,         /**< Group. */
    GEANY_KEY_GROUP_SETTINGS,       /**< Group. */
    GEANY_KEY_GROUP_SEARCH,         /**< Group. */
    GEANY_KEY_GROUP_GOTO,           /**< Group. */
    GEANY_KEY_GROUP_VIEW,           /**< Group. */
    GEANY_KEY_GROUP_FOCUS,          /**< Group. */
    GEANY_KEY_GROUP_NOTEBOOK,       /**< Group. */
    GEANY_KEY_GROUP_DOCUMENT,       /**< Group. */
    GEANY_KEY_GROUP_BUILD,          /**< Group. */
    GEANY_KEY_GROUP_TOOLS,          /**< Group. */
    GEANY_KEY_GROUP_HELP,           /**< Group. */
    GEANY_KEY_GROUP_COUNT   /* must not be used by plugins */
}

/** Keybinding command IDs for use with keybindings_send_command(). */
/* These IDs are used to lookup a keybinding. */
enum GeanyKeyBindingID
{
    GEANY_KEYS_EDITOR_TRANSPOSELINE,            /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_REMOVE_ERROR_INDICATORS, /**< Keybinding. */
    GEANY_KEYS_FOCUS_SEARCHBAR,                 /**< Keybinding. */
    GEANY_KEYS_SEARCH_FIND,                     /**< Keybinding. */
    GEANY_KEYS_FILE_SAVEALL,                    /**< Keybinding. */
    GEANY_KEYS_GOTO_NEXTMARKER,                 /**< Keybinding. */
    GEANY_KEYS_NOTEBOOK_SWITCHTABLEFT,          /**< Keybinding. */
    GEANY_KEYS_VIEW_ZOOMOUT,                    /**< Keybinding. */
    GEANY_KEYS_GOTO_LINE,                       /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_TOGGLEFOLD,             /**< Keybinding. */
    GEANY_KEYS_BUILD_COMPILE,                   /**< Keybinding. */
    GEANY_KEYS_EDITOR_SCROLLTOLINE,             /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_UNFOLDALL,              /**< Keybinding. */
    GEANY_KEYS_GOTO_MATCHINGBRACE,              /**< Keybinding. */
    GEANY_KEYS_SEARCH_FINDDOCUMENTUSAGE,        /**< Keybinding. */
    GEANY_KEYS_CLIPBOARD_PASTE,                 /**< Keybinding. */
    GEANY_KEYS_BUILD_MAKE,                      /**< Keybinding. */
    GEANY_KEYS_INSERT_ALTWHITESPACE,            /**< Keybinding. */
    GEANY_KEYS_EDITOR_SCROLLLINEDOWN,           /**< Keybinding. */
    GEANY_KEYS_VIEW_TOGGLEALL,                  /**< Keybinding. */
    GEANY_KEYS_VIEW_FULLSCREEN,                 /**< Keybinding. */
    GEANY_KEYS_GOTO_LINEEND,                    /**< Keybinding. */
    GEANY_KEYS_EDITOR_CALLTIP,                  /**< Keybinding. */
    GEANY_KEYS_FILE_PRINT,                      /**< Keybinding. */
    GEANY_KEYS_EDITOR_DUPLICATELINE,            /**< Keybinding. */
    GEANY_KEYS_FOCUS_SCRIBBLE,                  /**< Keybinding. */
    GEANY_KEYS_TOOLS_OPENCOLORCHOOSER,          /**< Keybinding. */
    GEANY_KEYS_SEARCH_PREVIOUSMESSAGE,          /**< Keybinding. */
    GEANY_KEYS_FILE_CLOSE,                      /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_REPLACETABS,            /**< Keybinding. */
    GEANY_KEYS_FILE_RELOAD,                     /**< Keybinding. */
    GEANY_KEYS_SEARCH_FINDNEXTSEL,              /**< Keybinding. */
    GEANY_KEYS_FOCUS_MESSAGES,                  /**< Keybinding. */
    GEANY_KEYS_BUILD_RUN,                       /**< Keybinding. */
    GEANY_KEYS_HELP_HELP,                       /**< Keybinding. */
    GEANY_KEYS_SETTINGS_PLUGINPREFERENCES,      /**< Keybinding. */
    GEANY_KEYS_VIEW_ZOOMRESET,                  /**< Keybinding. */
    GEANY_KEYS_SELECT_WORD,                     /**< Keybinding. */
    GEANY_KEYS_FORMAT_INCREASEINDENT,           /**< Keybinding. */
    GEANY_KEYS_SETTINGS_PREFERENCES,            /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD3,               /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_FOLDALL,                /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOVTE,                /**< Keybinding. */
    GEANY_KEYS_PROJECT_PROPERTIES,              /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_LINEWRAP,               /**< Keybinding. */
    GEANY_KEYS_EDITOR_MACROLIST,                /**< Keybinding.
                                                 * @deprecated 1.25, it doesn't do anything anymore */
    GEANY_KEYS_EDITOR_SUPPRESSSNIPPETCOMPLETION, /**< Keybinding. */
    GEANY_KEYS_FOCUS_SIDEBAR_SYMBOL_LIST,       /**< Keybinding. */
    GEANY_KEYS_GOTO_LINESTART,                  /**< Keybinding. */
    GEANY_KEYS_SEARCH_FINDUSAGE,                /**< Keybinding. */
    GEANY_KEYS_FILE_NEW,                        /**< Keybinding. */
    GEANY_KEYS_EDITOR_SNIPPETNEXTCURSOR,        /**< Keybinding. */
    GEANY_KEYS_NOTEBOOK_SWITCHTABRIGHT,         /**< Keybinding. */
    GEANY_KEYS_FILE_SAVE,                       /**< Keybinding. */
    GEANY_KEYS_FORMAT_INCREASEINDENTBYSPACE,    /**< Keybinding. */
    GEANY_KEYS_SEARCH_FINDNEXT,                 /**< Keybinding. */
    GEANY_KEYS_GOTO_TOGGLEMARKER,               /**< Keybinding. */
    GEANY_KEYS_GOTO_TAGDEFINITION,              /**< Keybinding. */
    GEANY_KEYS_SEARCH_NEXTMESSAGE,              /**< Keybinding. */
    GEANY_KEYS_EDITOR_DELETELINETOEND,          /**< Keybinding. */
    GEANY_KEYS_FORMAT_AUTOINDENT,               /**< Keybinding. */
    GEANY_KEYS_FILE_OPENSELECTED,               /**< Keybinding. */
    GEANY_KEYS_GOTO_BACK,                       /**< Keybinding. */
    GEANY_KEYS_INSERT_DATE,                     /**< Keybinding. */
    GEANY_KEYS_BUILD_PREVIOUSERROR,             /**< Keybinding. */
    GEANY_KEYS_GOTO_LINEENDVISUAL,              /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_REPLACESPACES,          /**< Keybinding. */
    GEANY_KEYS_FOCUS_EDITOR,                    /**< Keybinding. */
    GEANY_KEYS_SELECT_WORDPARTRIGHT,            /**< Keybinding. */
    GEANY_KEYS_VIEW_MESSAGEWINDOW,              /**< Keybinding. */
    GEANY_KEYS_FOCUS_SIDEBAR_DOCUMENT_LIST,     /**< Keybinding. */
    GEANY_KEYS_FORMAT_REFLOWPARAGRAPH,          /**< Keybinding. */
    GEANY_KEYS_EDITOR_MOVELINEUP,               /**< Keybinding. */
    GEANY_KEYS_NOTEBOOK_MOVETABLEFT,            /**< Keybinding. */
    GEANY_KEYS_SELECT_LINE,                     /**< Keybinding. */
    GEANY_KEYS_EDITOR_UNDO,                     /**< Keybinding. */
    GEANY_KEYS_EDITOR_MOVELINEDOWN,             /**< Keybinding. */
    GEANY_KEYS_CLIPBOARD_COPYLINE,              /**< Keybinding. */
    GEANY_KEYS_BUILD_MAKEOWNTARGET,             /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD2,               /**< Keybinding. */
    GEANY_KEYS_SEARCH_MARKALL,                  /**< Keybinding. */
    GEANY_KEYS_BUILD_LINK,                      /**< Keybinding. */
    GEANY_KEYS_FILE_CLOSEALL,                   /**< Keybinding. */
    GEANY_KEYS_GOTO_FORWARD,                    /**< Keybinding. */
    GEANY_KEYS_CLIPBOARD_CUT,                   /**< Keybinding. */
    GEANY_KEYS_NOTEBOOK_SWITCHTABLASTUSED,      /**< Keybinding. */
    GEANY_KEYS_NOTEBOOK_MOVETABRIGHT,           /**< Keybinding. */
    GEANY_KEYS_BUILD_OPTIONS,                   /**< Keybinding. */
    GEANY_KEYS_GOTO_TAGDECLARATION,             /**< Keybinding. */
    GEANY_KEYS_FILE_OPEN,                       /**< Keybinding. */
    GEANY_KEYS_EDITOR_COMPLETESNIPPET,          /**< Keybinding. */
    GEANY_KEYS_FORMAT_UNCOMMENTLINE,            /**< Keybinding. */
    GEANY_KEYS_FOCUS_VTE,                       /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD1,               /**< Keybinding. */
    GEANY_KEYS_SELECT_WORDPARTLEFT,             /**< Keybinding. */
    GEANY_KEYS_VIEW_ZOOMIN,                     /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_LINEBREAK,              /**< Keybinding. */
    GEANY_KEYS_EDITOR_REDO,                     /**< Keybinding. */
    GEANY_KEYS_EDITOR_CONTEXTACTION,            /**< Keybinding. */
    GEANY_KEYS_SEARCH_FINDPREVSEL,              /**< Keybinding. */
    GEANY_KEYS_FORMAT_DECREASEINDENTBYSPACE,    /**< Keybinding. */
    GEANY_KEYS_FORMAT_COMMENTLINETOGGLE,        /**< Keybinding. */
    GEANY_KEYS_SELECT_ALL,                      /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_RELOADTAGLIST,          /**< Keybinding. */
    GEANY_KEYS_BUILD_NEXTERROR,                 /**< Keybinding. */
    GEANY_KEYS_NOTEBOOK_MOVETABLAST,            /**< Keybinding. */
    GEANY_KEYS_SELECT_PARAGRAPH,                /**< Keybinding. */
    GEANY_KEYS_EDITOR_DELETELINE,               /**< Keybinding. */
    GEANY_KEYS_CLIPBOARD_COPY,                  /**< Keybinding. */
    GEANY_KEYS_VIEW_SIDEBAR,                    /**< Keybinding. */
    GEANY_KEYS_FILE_SAVEAS,                     /**< Keybinding. */
    GEANY_KEYS_FORMAT_COMMENTLINE,              /**< Keybinding. */
    GEANY_KEYS_GOTO_PREVWORDPART,               /**< Keybinding. */
    GEANY_KEYS_SEARCH_FINDPREVIOUS,             /**< Keybinding. */
    GEANY_KEYS_SEARCH_REPLACE,                  /**< Keybinding. */
    GEANY_KEYS_EDITOR_WORDPARTCOMPLETION,       /**< Keybinding. */
    GEANY_KEYS_EDITOR_AUTOCOMPLETE,             /**< Keybinding. */
    GEANY_KEYS_FOCUS_SIDEBAR,                   /**< Keybinding. */
    GEANY_KEYS_FOCUS_MESSAGE_WINDOW,            /**< Keybinding. */
    GEANY_KEYS_NOTEBOOK_MOVETABFIRST,           /**< Keybinding. */
    GEANY_KEYS_GOTO_PREVIOUSMARKER,             /**< Keybinding. */
    GEANY_KEYS_EDITOR_SCROLLLINEUP,             /**< Keybinding. */
    GEANY_KEYS_FOCUS_COMPILER,                  /**< Keybinding. */
    GEANY_KEYS_FORMAT_TOGGLECASE,               /**< Keybinding. */
    GEANY_KEYS_CLIPBOARD_CUTLINE,               /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_REMOVE_MARKERS,         /**< Keybinding. */
    GEANY_KEYS_BUILD_MAKEOBJECT,                /**< Keybinding. */
    GEANY_KEYS_FORMAT_DECREASEINDENT,           /**< Keybinding. */
    GEANY_KEYS_FILE_OPENLASTTAB,                /**< Keybinding. */
    GEANY_KEYS_SEARCH_FINDINFILES,              /**< Keybinding. */
    GEANY_KEYS_GOTO_NEXTWORDPART,               /**< Keybinding. */
    GEANY_KEYS_INSERT_LINEAFTER,                /**< Keybinding. */
    GEANY_KEYS_INSERT_LINEBEFORE,               /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_REMOVE_MARKERS_INDICATORS,  /**< Keybinding. */
    GEANY_KEYS_PROJECT_OPEN,                    /**< Keybinding. */
    GEANY_KEYS_PROJECT_NEW,                     /**< Keybinding. */
    GEANY_KEYS_PROJECT_CLOSE,                   /**< Keybinding. */
    GEANY_KEYS_FORMAT_JOINLINES,                /**< Keybinding. */
    GEANY_KEYS_GOTO_LINESTARTVISUAL,            /**< Keybinding. */
    GEANY_KEYS_DOCUMENT_CLONE,                  /**< Keybinding. */
    GEANY_KEYS_FILE_QUIT,                       /**< Keybinding. */
    GEANY_KEYS_FILE_PROPERTIES,                 /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD4,               /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD5,               /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD6,               /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD7,               /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD8,               /**< Keybinding. */
    GEANY_KEYS_FORMAT_SENDTOCMD9,               /**< Keybinding. */
    GEANY_KEYS_EDITOR_DELETELINETOBEGINNING,    /**< Keybinding. */
    GEANY_KEYS_COUNT    /* must not be used by plugins */
}

struct GeanyKeyGroup;

/** Represents a single keybinding action.
 *
 * Use keybindings_set_item() to set. */
struct GeanyKeyBinding
{
    guint key;              /**< Key value in lower-case, such as @c GDK_a or 0 */
    GdkModifierType mods;   /**< Modifier keys, such as @c GDK_CONTROL_MASK or 0 */
    gchar *name;            /**< Key name for the configuration file, such as @c "menu_new" */
    /** Label used in the preferences dialog keybindings tab.
     * May contain underscores - these won't be displayed. */
    gchar *label;
    /** Function called when the key combination is pressed, or @c NULL to use the group callback
     * (preferred). @see plugin_set_key_group(). */
    GeanyKeyCallback callback;
    GtkWidget *menu_item;   /**< Optional widget to set an accelerator for, or @c NULL */
    guint id;
    guint default_key;
    GdkModifierType default_mods;
    GeanyKeyBindingFunc cb_func;
    gpointer cb_data;
    GDestroyNotify cb_data_destroy;
};

/** Function pointer type used for keybinding group callbacks.
 *
 * You should return @c TRUE to indicate handling the callback. (Occasionally, if the keybinding
 * cannot apply in the current situation, it is useful to return @c FALSE to allow a later keybinding
 * with the same key combination to handle it). */
alias GeanyKeyGroupCallback = gboolean function(guint key_id);

/** Function pointer type used for keybinding callbacks, with userdata for passing context
 *
 * You should return @c TRUE to indicate handling the callback. (Occasionally, if the keybinding
 * cannot apply in the current situation, it is useful to return @c FALSE to allow a later keybinding
 * with the same key combination to handle it).
 *
 * @since 1.26 (API 226) */
alias GeanyKeyBindingFunc = gboolean function(GeanyKeyBinding* key, guint key_id, gpointer user_data);

/** Function pointer type used for keybinding callbacks. */
alias GeanyKeyCallback = void function(guint key_id);

@nogc:

GeanyKeyBinding* keybindings_get_item(GeanyKeyGroup* group, gsize key_id);

GeanyKeyBinding* keybindings_set_item(
        GeanyKeyGroup* group,
        gsize key_id,
        GeanyKeyCallback callback,
        guint key,
        GdkModifierType mod,
        const(gchar)* name,
        const(gchar)* label,
        GtkWidget* menu_item
    );
