import cherrypy
from blueberrypy.template_engine import get_template

class Root(object):
    @cherrypy.expose
    def default(self):
        raise cherrypy.HTTPRedirect('/chat')

#    @cherrypy.expose
#    def index(self):
#        tmpl = get_template("index.html")
#        return tmpl.render()
