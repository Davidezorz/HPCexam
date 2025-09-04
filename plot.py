import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import argparse
import os
import re
from glob import glob



def load_dump(filename, x_size, y_size):
    """Load binary dump file into a 2D numpy array."""
    data = np.fromfile(filename, dtype=np.float32)
    if data.size != x_size * y_size:
        raise ValueError(f"{filename}: Expected {x_size * y_size} values, got {data.size}")
    return data.reshape((y_size, x_size))



def get_sorted_bin_files(folder, limit=None):
    """Retrieve .bin files sorted by step number (from filename)."""
    files = glob(os.path.join(folder, 'plane_*.bin'))
    step_re = re.compile(r'plane_(\d+)\.bin')
    
    # Sort based on step number
    files = sorted(files, key=lambda f: int(step_re.search(f).group(1)))
    return files[:limit] if limit else files



def animate_frames(frames, interval=100, save=None):
    """Create and show or save a matplotlib animation."""
    fig, ax = plt.subplots()
    im = ax.imshow(frames[0], cmap='hot', interpolation='nearest', origin='lower')
    cbar = plt.colorbar(im, ax=ax)
    cbar.set_label("Heat")

    def update(frame):
        im.set_array(frame)
        return [im]

    ani = animation.FuncAnimation(fig, update, frames=frames, interval=interval, blit=True)

    if save:
        print(f"Saving animation to {save}...")
        if save.endswith('.gif'):
            ani.save(save, writer='pillow', fps=10)
        else:
            ani.save(save, writer='ffmpeg', fps=10)
    else:
        plt.show()





# —————————————————————————————————————————————————————————————
# MAIN
# —————————————————————————————————————————————————————————————



def main():
    parser = argparse.ArgumentParser(description="Animate heatmap .bin files from dump().")
    parser.add_argument("folder", help="Folder containing plane_XXXXX.bin files")
    parser.add_argument("-x", "--xsize", type=int, required=True, help="Grid size in x-direction")
    parser.add_argument("-y", "--ysize", type=int, required=True, help="Grid size in y-direction")
    parser.add_argument("-n", "--num", type=int, help="Number of frames to use (optional)")
    parser.add_argument("--save", help="Save animation as .mp4 or .gif instead of displaying")

    args = parser.parse_args()

    bin_files = get_sorted_bin_files(args.folder, args.num)
    if not bin_files:
        print("No .bin files found in the folder.")
        return

    print(f"Loading {len(bin_files)} frames from '{args.folder}'...")
    frames = [load_dump(f, args.xsize, args.ysize) for f in bin_files]

    animate_frames(frames, save=args.save)

if __name__ == "__main__":
    main()
    
    
    
# python plot.py data -x 256 -y 256 -n 200 --save heat_animation.mp4

