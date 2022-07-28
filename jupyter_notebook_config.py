c = get_config()
c.NotebookApp.allow_root = True
c.NotebookApp.disable_check_xsrf = True
c.NotebookApp.token = ''
c.NotebookApp.password = ''
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = '8888'
c.NotebookApp.open_browser = False