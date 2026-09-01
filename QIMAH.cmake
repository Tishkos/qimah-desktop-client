# SPDX-License-Identifier: GPL-2.0-or-later
#
# Branding definition for the Qimah Al-Safinah Files desktop client.
# Replaces the upstream branding file; included from CMakeLists.txt.
# Keeping this in its own file (rather than editing the upstream one) keeps
# future merges from upstream clean.

set( APPLICATION_NAME       "Qimah Al-Safinah Files" )
set( APPLICATION_SHORTNAME  "QimahFiles" )
set( APPLICATION_EXECUTABLE "qimahfiles" )
set( APPLICATION_ICON_NAME  "QimahFiles" )

set( APPLICATION_CONFIG_NAME "${APPLICATION_EXECUTABLE}" )
set( APPLICATION_DOMAIN     "qs-groups.com" )
set( APPLICATION_VENDOR     "Qimah Al-Safinah" )

# No self-hosted update server, so leave the updater URL empty rather than
# pointing users' clients at the upstream update feed.
set( APPLICATION_UPDATE_URL "" CACHE STRING "URL for updater" )
set( APPLICATION_HELP_URL   "" CACHE STRING "URL for the help menu" )

set( APPLICATION_ICON_SET   "SVG" )

# Pre-fill the server field. ENFORCE locks the client to this server only:
# turn it OFF if staff ever need to connect somewhere else.
set( APPLICATION_SERVER_URL "https://files.qs-groups.com" CACHE STRING "URL for the server to use" )
set( APPLICATION_SERVER_URL_ENFORCE ON )

set( APPLICATION_REV_DOMAIN      "com.qsgroups.qimahfiles" )
set( APPLICATION_REV_DOMAIN_DBUS "qimahfiles.qs-groups.com" )
set( APPLICATION_VIRTUALFILE_SUFFIX "qimahfiles" CACHE STRING "Virtual file suffix (not including the .)")
set( APPLICATION_OCSP_STAPLING_ENABLED OFF )
set( APPLICATION_FORBID_BAD_SSL OFF )

set( LINUX_PACKAGE_SHORTNAME "qimahfiles" )
set( LINUX_APPLICATION_ID "${APPLICATION_REV_DOMAIN}.${LINUX_PACKAGE_SHORTNAME}")

# Internal C++ class; unchanged because we are not shipping a custom Theme
# subclass. Not user-visible anywhere.
set( THEME_CLASS            "NextcloudTheme" )
set( WIN_SETUP_BITMAP_PATH  "${CMAKE_SOURCE_DIR}/admin/win/nsi" )

set( MAC_INSTALLER_BACKGROUND_FILE "${CMAKE_SOURCE_DIR}/admin/osx/installer-background.png" CACHE STRING "The MacOSX installer background image")

## Updater options — off, since there is no update server to talk to.
option( BUILD_UPDATER "Build updater" OFF )

# Hide the "recommended providers" signup list: this is a private company build.
option( WITH_PROVIDERS "Build with providers list" OFF )

option( ENFORCE_VIRTUAL_FILES_SYNC_FOLDER "Enforce use of virtual files sync folder when available" OFF )
option( DISABLE_VIRTUAL_FILES_SYNC_FOLDER "Disable use of virtual files sync folder even when available" OFF )
option( ENFORCE_SINGLE_ACCOUNT "Enforce use of a single account in desktop client" OFF )
option( DO_NOT_USE_PROXY "Do not use system wide proxy, instead always do a direct connection to server" OFF )
option( WIN_DISABLE_USERNAME_PREFILL "Do not prefill the Windows user name when creating a new account" OFF )

## Theming — brand blue sampled from the company logo.
set( NEXTCLOUD_BACKGROUND_COLOR "#0A47A6" CACHE STRING "Default background color")
set( APPLICATION_WIZARD_HEADER_BACKGROUND_COLOR ${NEXTCLOUD_BACKGROUND_COLOR} CACHE STRING "Hex color of the wizard header background")
set( APPLICATION_WIZARD_HEADER_TITLE_COLOR "#ffffff" CACHE STRING "Hex color of the text in the wizard header")
option( APPLICATION_WIZARD_USE_CUSTOM_LOGO "Use the logo from ':/client/theme/colored/wizard_logo.(png|svg)'" ON )

#
## Windows Shell Extensions & MSI
## GUIDs regenerated for this build - they MUST differ from upstream's, or the
## shell extensions and MSI would collide with an upstream install on the same PC.
#
if(WIN32)
    set( WIN_SHELLEXT_CONTEXT_MENU_GUID      "{8B6B782B-9CFF-4F6A-A34E-8C32ABD3A768}" )

    set( WIN_SHELLEXT_OVERLAY_GUID_ERROR     "{7C820B4B-7571-46C8-BD15-01C7362BA58D}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK        "{AF76B013-733F-40EE-A078-B7CB57855C31}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK_SHARED "{E2097FE0-E7C5-41B8-BC7E-94FE2BB47848}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_SYNC      "{A67FC501-BF83-4974-AB39-A537EA79BF6F}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_WARNING   "{3415BC10-CBBF-40C6-9B20-7CC680EFA4C3}" )

    set( WIN_MSI_UPGRADE_CODE                "127A5B66-C6D0-4F4C-8693-0E24CBE2A171" )

    option( BUILD_WIN_MSI "Build MSI scripts and helper DLL" ON )
    option( BUILD_WIN_TOOLS "Build Win32 migration tools" OFF )
endif()
