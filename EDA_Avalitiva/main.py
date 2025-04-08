class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def max_depth(root):
    if not root:
        return 0
    return 1 + max(max_depth(root.left), max_depth(root.right))


def build_tree_from_list(lst):
    if not lst:
        return None
    nodes = [TreeNode(val) if val is not None else None for val in lst]
    kids = nodes[::-1]
    root = kids.pop()
    for node in nodes:
        if node:
            if kids: node.left = kids.pop()
            if kids: node.right = kids.pop()
    return root


def preorder_traversal(root):
    return [root.val if root else None] + preorder_traversal(root.left) + preorder_traversal(root.right) if root else []


def inorder_traversal(root):
    return inorder_traversal(root.left) + [root.val if root else None] + inorder_traversal(root.right) if root else []


def postorder_traversal(root):
    return postorder_traversal(root.left) + postorder_traversal(root.right) + [
        root.val if root else None] if root else []


def clean_traversal_list(lst):
    while lst and lst[-1] is None:
        lst.pop()
    return lst


def main():
    lst = [5, 3, 8, 1, 4, 7, 9, None, 2, None, None, 6]
    original_tree = build_tree_from_list(lst)

    original_depth = max_depth(original_tree)

    preorder_list = clean_traversal_list(preorder_traversal(original_tree))
    inorder_list = clean_traversal_list(inorder_traversal(original_tree))
    postorder_list = clean_traversal_list(postorder_traversal(original_tree))

    preorder_tree = build_tree_from_list(preorder_list)
    inorder_tree = build_tree_from_list(inorder_list)
    postorder_tree = build_tree_from_list(postorder_list)

    print("Lista Pré-Ordem:", preorder_list)
    print("Lista Em Ordem:", inorder_list)
    print("Lista Pós-Ordem:", postorder_list)
    print("\nProfundidade da árvore original:", original_depth)
    print("Profundidade da árvore Pré-Ordem:", max_depth(preorder_tree))
    print("Profundidade da árvore Em Ordem:", max_depth(inorder_tree))
    print("Profundidade da árvore Pós-Ordem:", max_depth(postorder_tree))


if __name__ == "__main__":
    main()
