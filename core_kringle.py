#!/usr/bin/env python3

import argparse
from random import choice


encode_table = {}
decode_table = {}


def read_table():
    with open('table_kringle', 'r') as finp:
        for row in finp:
            egg = row.strip().split(',')
            encode_table[egg[0]] = egg[1:]
            for el in egg[1:]:
                decode_table[el] = egg[0]


def encode_file(finp, fout):
    with open(finp, 'r') as rd, open(fout, 'w') as wr:
        for ch in rd.read():
            if ch in encode_table:
                wr.write(choice(encode_table[ch]))
                wr.write(' ')


def decode_file(finp, fout):
    with open(finp, 'r') as rd, open(fout, 'w') as wr:
        for row in rd:
            for w in row.strip().split(' '):
                wr.write(decode_table[w])


def main():
    read_table()
    parser = argparse.ArgumentParser()
    parser.add_argument('finp', help='Input file')
    parser.add_argument('fout', help='Output file')
    parser.add_argument('-d', '--decode', help='Decode input file', action='store_true')
    args = parser.parse_args()
    f = decode_file if args.decode else encode_file
    f(args.finp, args.fout)


if __name__ == '__main__':
    main()
