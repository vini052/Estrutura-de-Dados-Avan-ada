class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def dfs(root):
    if not root:
        return 0
    return 1 + max(dfs(root.left), dfs(root.right))


def construtor_arvore(lst):
    if not lst:
        return None
    nodes = [TreeNode(val) if val is not None else None for val in lst]
    filhos = nodes[::-1]
    root = filhos.pop()
    for node in nodes:
        if node:
            if filhos: node.left = filhos.pop()
            if filhos: node.right = filhos.pop()
    return root


def pre_ordem(root):
    return [root.val if root else None] + pre_ordem(root.left) + pre_ordem(root.right) if root else []


def em_ordem(root):
    return em_ordem(root.left) + [root.val if root else None] + em_ordem(root.right) if root else []


def pos_ordem(root):
    return pos_ordem(root.left) + pos_ordem(root.right) + [
        root.val if root else None] if root else []


def limpar_lista(lst):
    while lst and lst[-1] is None:
        lst.pop()
    return lst


def main():
    lst = [5, 3, 8, 1, 4, 7, 9, None, 2, None, None, 6]
    arvore_original = construtor_arvore(lst)

    busca_original = dfs(arvore_original)

    vetor_pre_ordem = limpar_lista(pre_ordem(arvore_original))
    vetor_em_ordem = limpar_lista(em_ordem(arvore_original))
    vetor_pos_ordem = limpar_lista(pos_ordem(arvore_original))

    arvore_pre_ordem = construtor_arvore(vetor_pre_ordem)
    arvore_em_ordem = construtor_arvore(vetor_em_ordem)
    arvore_pos_ordem = construtor_arvore(vetor_pos_ordem)

    print("Lista Pré-Ordem:", vetor_pre_ordem)
    print("Lista Em Ordem:", vetor_em_ordem)
    print("Lista Pós-Ordem:", vetor_pos_ordem)
    print("\nProfundidade da árvore original:", busca_original)
    print("Profundidade da árvore Pré-Ordem:", dfs(arvore_pre_ordem))
    print("Profundidade da árvore Em Ordem:", dfs(arvore_em_ordem))
    print("Profundidade da árvore Pós-Ordem:", dfs(arvore_pos_ordem))


if __name__ == "__main__":
    main()
