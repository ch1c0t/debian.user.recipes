import pynvim

import logging
logging.basicConfig(filename='/tmp/pynvim.logging', level=logging.INFO)

@pynvim.plugin
class TestPlugin(object):
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command("MyPythonCommand")
    def my_command_handler(self):
        self.nvim.command("vnew")

        buffers = self.nvim.api.list_bufs()
        buffer_lines = [
            f'{buffer.number} {len(buffer)} {buffer.name} {buffer.valid}'
            for buffer in buffers
        ]
        lines = [
            str(len(buffers)),
            *buffer_lines
        ]

        self.nvim.current.buffer[:] = lines

    @pynvim.function("MyPythonFunction")
    def my_function_handler(self, args):
        data = args[0]
        logging.info(data)
