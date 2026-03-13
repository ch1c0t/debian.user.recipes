import pynvim

@pynvim.plugin
class TestPlugin(object):
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command("MyPythonCommand")
    def my_command_handler(self):
        self.nvim.current.line = "Hello from your Python plugin!"

    @pynvim.function("MyPythonFunction")
    def my_function_handler(self, args):
        # args will contain a list of arguments passed from Neovim
        message = f"Args received: {args}"
        self.nvim.command(f'echo "{message}"')
        return message
