import pynvim

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
        # args will contain a list of arguments passed from Neovim
        message = f"Args received: {args}"
        self.nvim.command(f'echo "{message}"')
        return message

    @pynvim.autocmd('BufEnter', pattern='*.py', eval='expand("<afile>")')
    def do(self, filename):
        self.nvim.out_write(f'Entered file: {filename}\n')
