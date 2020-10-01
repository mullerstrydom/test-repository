class StringUtils:

    @staticmethod
    def concat(string1: str, string2: str):
        return '{}{}'.format(string1, string2)

    @staticmethod
    def padding_right(string1: str, length: int, padding: str = " "):
        if len(string1) > length:
            return string1[0: length]
        while len(string1) < length:
            string1 = '{}{}'.format(string1, padding)
        return string1

    @staticmethod
    def padding_left(string1: str, length: int, padding: str = " "):
        if len(string1) > length:
            return string1[0: length]
        while len(string1) < length:
            string1 = '{}{}'.format(padding, string1)
        return string1
