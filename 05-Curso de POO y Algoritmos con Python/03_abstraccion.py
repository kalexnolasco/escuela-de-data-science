class WashingMachine:
    """WashingMachine"""
    def __init__(self):
        pass

    def to_wash(self, temperature='HOT'):
        self._complete_water(temperature)
        self._add_soap()
        self._to_wash()
        self._to_centrifuge()

    def _complete_water(self, temperature):
        print(f"adding water with temperature {temperature}")

    def _add_soap(self):
        print("Adding soap")

    def _to_wash(self):
        print("start to wash")

    def _to_centrifuge(self):
        print("start to centrifuge")


if __name__ == '__main__':
    wm = WashingMachine()
    wm.to_wash()
