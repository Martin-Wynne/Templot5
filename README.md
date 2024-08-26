# Templot5

Templot5 is the open-source version of Templot by Martin Wynne.

The official website for Templot can be found at https://85a.uk/templot

## Build instructions

1. Clone the Templot repo from Github
2. If you don't already have Lazarus IDE, download and install the latest version from https://www.lazarus-ide.org
3. In Lazarus, click **_Package > Online Package Manager..._**, and then install the HtmlViewer package.
4. Open the folder containing the source for the HtmlViewer component. This can be done by:
   a. Select the "HtmlViewer/FrameViewer" tab in Lazarus
   b. Right-click on the blue "html" icon in the toolbar
   c. Select **_Open unit ...file path...\FrameViewerReg.pas_**
   d. Right-click on the file path at the bottom of the editor window, and select **_Open Folder..._**
5. Copy the files from the `HTML_VIEWER_MODS` folder in the repo to the HtmlViewer component source folder.
6. In Lazarus, click **_File > Open..._** menu, navigate to the cloned repo, select and open `OpenTemplot2024.lpi`
7. In Lazarus, click **_Run > Build_** menu to do a full build of the project.
8. The compiled executable will be in the `TEMPLOT5_OUTPUT` folder in the repo directory.

More detailed instructions (with screen captures) can be found on the Templot website:
* https://85a.uk/templot/club/index.php?threads/opentemplot2024.839/post-11725 (basic build)
* https://85a.uk/templot/club/index.php?posts/11781 (updating the HtmlViewer component)


