import unittest

from test_repository.string_utils import StringUtils


class TestStringUtils(unittest.TestCase):

    def test_positive_concat(self):
        string1 = 'Testing'
        string2 = '12'
        expected = 'Testing12'
        result = StringUtils.concat(string1, string2)
        self.assertEqual(expected, result)

    def test_positive_padding_right(self):
        string1 = 'Test'
        expected_result = 'Test '
        result = StringUtils.padding_right(string1, 5)
        self.assertEqual(expected_result, result)

        string2 = 'Testing'
        expected_result = 'Testi'
        result = StringUtils.padding_right(string2, 5)
        self.assertEqual(expected_result, result)

    def test_positive_padding_left(self):
        string1 = 'Test'
        expected_result = ' Test'
        result = StringUtils.padding_left(string1, 5)
        self.assertEqual(expected_result, result)

        string2 = 'Testing'
        expected_result = 'Testi'
        result = StringUtils.padding_left(string2, 5)
        self.assertEqual(expected_result, result)
