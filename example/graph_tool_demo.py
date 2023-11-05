import graph_tool.all as gt
import matplotlib.pyplot as plt
import numpy as np
import matplotlib

g = gt.collection.ns["twitter_higgs/retweet"]

print(g)

g.list_properties()

#plotting degree distributions

in_hist = gt.vertex_hist(g, "in")

out_hist = gt.vertex_hist(g, "out")

y = in_hist[0]
err = np.sqrt(in_hist[0])
plt.errorbar(in_hist[1][:-1], in_hist[0], fmt="o", yerr=err,
        label="in")

y = out_hist[0]
err = np.sqrt(out_hist[0])
plt.errorbar(out_hist[1][:-1], out_hist[0], fmt="o", yerr=err,
        label="out")

plt.yscale("log")
plt.xscale("log")

plt.xlabel("$k$")
plt.ylabel("$NP(k_{in})$")

plt.tight_layout()
plt.legend()

# extract and plot largest component

u = gt.extract_largest_component(g)

print(u)

u = gt.Graph(u, prune=True)

print(u)

gt.graph_draw(u, pos)

# find highest in-degree

maximum = max(u.get_in_degrees(u.get_vertices()))

print(np.where(u.get_in_degrees(u.get_vertices()) == maximum))
print(u.get_in_degrees(u.get_vertices()))

# run nested blockmodel

state = gt.minimize_nested_blockmodel_dl(u)

t = gt.get_hierarchy_tree(state)[0]

tpos = pos = gt.radial_tree_layout(t, t.vertex(t.num_vertices() - 1, use_index=False), weighted=True)

cts = gt.get_hierarchy_control_points(u, t, tpos)

pos = u.own_property(tpos)

b = state.levels[0].b

shape = b.copy()

shape.a %= 14

gt.graph_draw(u, pos=pos, vertex_fill_color=b, vertex_shape=shape, edge_control_points=cts,

              edge_color=[0, 0, 0, 0.3], vertex_anchor=0)
              

# get shortest paths

dist = gt.shortest_distance(u, source=u.vertex(1))

print(dist.a)

plt.hist(dist.a)

# centrality measures

pr = gt.pagerank(u)

gt.graph_draw(u, pos=u.vp["_pos"], vertex_fill_color=pr,

              vertex_size=gt.prop_to_size(pr, mi=5, ma=15),

              vorder=pr, vcmap=matplotlib.cm.gist_heat)

# clustering coefficient

clust = gt.local_clustering(u)

print(gt.vertex_average(u, clust))

# regular blockmodel

state = gt.minimize_blockmodel_dl(u)

state.draw(pos=u.vp["_pos"], vertex_shape=state.get_blocks())

print(state.get_blocks().a)

pos = gt.sfdp_layout(u)
